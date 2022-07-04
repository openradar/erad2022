#!/usr/bin/env bash
set -x

# needed for environment variables
conda activate $RADARENV

# Install hlhdf from source into conda env
cd ~
if [ ! -d tmp ]; then
    mkdir tmp
fi
cd tmp
git clone --depth=1 https://github.com/baltrad/hlhdf.git
cd hlhdf/

./configure --prefix=$CONDA_PREFIX/hlhdf \
            --with-hdf5=$CONDA_PREFIX/include,$CONDA_PREFIX/lib \
            --enable-py3support \
            --with-py3bin=$CONDA_PREFIX/bin/python3 \
            --with-numpy=$CONDA_PREFIX/lib/python3.9/site-packages/numpy/core/include/numpy/
make
make test
make install
mv $CONDA_PREFIX/hlhdf/hlhdf.pth $CONDA_PREFIX/lib/python3.9/site-packages/.

grep -l hlhdf ~/.bashrc
if [[ $? == 1 ]]; then
    echo "export PATH=\"\$PATH:$CONDA_PREFIX/hlhdf/bin\"" >> ~/.bashrc
    echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib\"" >> ~/.bashrc;
fi
