#!/usr/bin/env bash
set -x

# needed for environment variables
conda activate $RADARENV

# needed to find dependencies
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib
export RAVEROOT=$CONDA_PREFIX

cd ~
if [ ! -d tmp ]; then
    mkdir tmp
fi
cd tmp
git clone --depth 1 https://github.com/DanielMichelson/drqc_py3.git
cd drqc_py3/

make
make test
make install
cd ~
