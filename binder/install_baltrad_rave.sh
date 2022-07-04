#!/usr/bin/env bash
set -x

# needed for environment variables
conda activate $RADARENV

# needed to find dependencies
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib

# Install RAVE from source
cd ~
if [ ! -d tmp ]; then
    mkdir tmp
fi
cd tmp
git clone --depth=1 https://github.com/baltrad/rave.git
cd rave
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_bdb.py
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_dom_db.py
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_bdb.py
sed -i -e 's/from baltrad.bdbclient/#from baltrad.bdbclient/g' Lib/rave_bdb.py
sed -i -e 's/from keyczar import keyczar/#from keyczar import keyczar/g' Lib/BaltradFrame.py
# kmuehlbauer: This file is missing currently, so disabling
# cp -p ~/binder/baltrad/fix_shebang.sh bin/.  # Copies in path to Python for conda

./configure --prefix=$CONDA_PREFIX/rave \
            --with-hlhdf=$CONDA_PREFIX/hlhdf \
            --with-proj=$CONDA_PREFIX/include,$CONDA_PREFIX/lib \
            --with-expat=$CONDA_PREFIX/include,$CONDA_PREFIX/lib \
            --with-numpy=$CONDA_PREFIX/lib/python3.9/site-packages/numpy/core/include/numpy/ \
            --with-netcdf=$CONDA_PREFIX/include,$CONDA_PREFIX/lib \
            --with-python-makefile=$CONDA_PREFIX/lib/python3.9/config-3.9-x86_64-linux-gnu/Makefile
make
make test
make install
# Copy files that need (temporary) monkeying to transition to Py3
# kmuehlbauer: not sure, if this is needed any more, disabling for now
# cp -r ~/binder/baltrad/opt/baltrad/rave/Lib/* $CONDA_PREFIX/rave/Lib/

grep -l rave ~/.bashrc
if [[ $? == 1 ]]; then
    echo "export RAVEROOT=$CONDA_PREFIX" >> ~/.bashrc
    echo "export PATH=\"\$PATH:$CONDA_PREFIX/rave/bin\"" >> ~/.bashrc;
    echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/rave/lib\"" >> ~/.bashrc;
fi
