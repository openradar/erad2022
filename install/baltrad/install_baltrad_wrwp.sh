#!/usr/bin/env bash
set -x

# needed to find dependencies
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib

# HACK we need .../rave/tmp to exist
mkdir $CONDA_PREFIX/rave/tmp

# download
cd $BALTRAD_INSTALL_ROOT/tmp
git clone --depth 1 https://github.com/baltrad/baltrad-wrwp.git
cd baltrad-wrwp/

# build, test and install
./configure --prefix=$CONDA_PREFIX/baltrad-wrwp --with-rave=$CONDA_PREFIX/rave --with-blas=$CONDA_PREFIX/lib --with-cblas=$CONDA_PREFIX/lib --with-lapack=$CONDA_PREFIX/lib --with-lapacke=$CONDA_PREFIX/include,$CONDA_PREFIX/lib
make
make test
make install

# activation script
grep -l wrwp ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
if [[ $? == 1 ]]; then
    echo "export PATH=\"\$PATH:$CONDA_PREFIX/baltrad-wrwp/bin\"" >> ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
    echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/baltrad-wrwp/lib\"" >> ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
fi
