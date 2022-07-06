#!/usr/bin/env bash
# show commands before execution
set -x

# do not fail GHA on nonzero exit status
set +e

# download
cd $BALTRAD_INSTALL_ROOT/tmp
git clone --depth=1 https://github.com/baltrad/hlhdf.git
cd hlhdf/

# build, test and install
./configure --prefix=$CONDA_PREFIX/hlhdf \
            --with-hdf5=$CONDA_PREFIX/include,$CONDA_PREFIX/lib \
            --enable-py3support \
            --with-py3bin=$CONDA_PREFIX/bin/python3 \
            --with-numpy=$CONDA_PREFIX/lib/python3.9/site-packages/numpy/core/include/numpy/
make
make test
make install
mv $CONDA_PREFIX/hlhdf/hlhdf.pth $CONDA_PREFIX/lib/python3.9/site-packages/.

# activation script
grep -l hlhdf ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
if [[ $? == 1 ]]; then
    echo "export PATH=\"\$PATH:$CONDA_PREFIX/hlhdf/bin\"" >> ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
    echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib\"" >> ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
fi
