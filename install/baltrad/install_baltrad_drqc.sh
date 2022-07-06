#!/usr/bin/env bash
# show commands before execution
set -x

# do not fail GHA on nonzero exit status
set +e

# needed to find dependencies
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib
export RAVEROOT=$CONDA_PREFIX

# download
cd $BALTRAD_INSTALL_ROOT/tmp
git clone --depth 1 https://github.com/DanielMichelson/drqc_py3.git
cd drqc_py3/

# build, test, install
make
make test
make install
