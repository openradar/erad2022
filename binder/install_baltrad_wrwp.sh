#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD wrwp from source
export CONDA_PREFIX=/srv/conda/envs/notebook

# Install system dependencies, not conda in this case
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib

# HACK some include files are not copied when RAVE is installed
cd ~
if [ ! -d tmp ]; then
    mkdir tmp
fi
cd tmp

# HACK we need .../rave/tmp to exist
mkdir $CONDA_PREFIX/rave/tmp
chown jovyan:jovyan $CONDA_PREFIX/rave/tmp

# install baltrad_wrwp from source
cd ~
cd tmp
git clone --depth 1 https://github.com/baltrad/baltrad-wrwp.git
cd baltrad-wrwp/

source $CONDA_DIR/bin/activate $RADARENV
# Why must the following line be explicit? Second time just to be safe...
export CONDA_PREFIX=/srv/conda/envs/notebook

./configure --prefix=$CONDA_PREFIX/baltrad-wrwp --with-rave=$CONDA_PREFIX/rave --with-blas=$CONDA_PREFIX/lib --with-cblas=$CONDA_PREFIX/lib --with-lapack=$CONDA_PREFIX/lib --with-lapacke=$CONDA_PREFIX/include,$CONDA_PREFIX/lib
make
make test
make install

grep -l wrwp ~/.bashrc
if [[ $? == 1 ]]; then
    echo "export PATH=\"\$PATH:$CONDA_PREFIX/baltrad-wrwp/bin\"" >> ~/.bashrc;
    echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/baltrad-wrwp/lib\"" >> ~/.bashrc;
fi
