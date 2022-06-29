#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD RAVE component

# Install RAVE from source
cd ~
if [ ! -d tmp ]; then
    mkdir tmp
fi
cd tmp
git clone --depth=1 https://github.com/baltrad/rave-py3.git
cd rave-py3
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_bdb.py
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_dom_db.py
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_bdb.py
sed -i -e 's/from baltrad.bdbclient/#from baltrad.bdbclient/g' Lib/rave_bdb.py
sed -i -e 's/from keyczar import keyczar/#from keyczar import keyczar/g' Lib/BaltradFrame.py
cp -p ~/binder/baltrad/fix_shebang.sh bin/.  # Copies in path to Python for conda

source $CONDA_DIR/bin/activate $RADARENV
# Why must the following line be explicit?
export CONDA_PREFIX=/srv/conda/envs/notebook

./configure --prefix=$CONDA_PREFIX/rave \
            --with-hlhdf=$CONDA_PREFIX/hlhdf \
            --with-proj=$CONDA_PREFIX/include,$CONDA_PREFIX/lib \
            --with-expat=$CONDA_PREFIX/include,$CONDA_PREFIX/lib \
            --with-numpy=$CONDA_PREFIX/lib/python3.7/site-packages/numpy/core/include/numpy/ \
            --with-netcdf=$CONDA_PREFIX/include,$CONDA_PREFIX/lib \
            --enable-py3support \
            --with-py3bin=$CONDA_PREFIX/bin/python \
            --with-py3bin-config=$CONDA_PREFIX/bin/python3-config \
            --with-python-makefile=$CONDA_PREFIX/lib/python3.7/config-3.7m-x86_64-linux-gnu/Makefile
make
make test
make install
# Copy files that need (temporary) monkeying to transition to Py3
cp -r ~/binder/baltrad/opt/baltrad/rave/Lib/* $CONDA_PREFIX/rave/Lib/

grep -l rave ~/.bashrc
if [[ $? == 1 ]]; then
    echo "export RAVEROOT=$CONDA_PREFIX" >> ~/.bashrc
    echo "export PATH=\"\$PATH:$CONDA_PREFIX/rave/bin\"" >> ~/.bashrc;
    echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/rave/lib\"" >> ~/.bashrc;
fi
