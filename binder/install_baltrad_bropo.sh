#!/usr/bin/env bash
set -x

# needed for environment variables
conda activate $RADARENV

# needed to find dependencies
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib

# install bropo from source
cd ~
if [ ! -d tmp ]; then
    mkdir tmp
fi
cd tmp
git clone --depth 1 https://github.com/baltrad/bropo.git
cd bropo/

#source $CONDA_DIR/bin/activate $RADARENV
# Why must the following line be explicit? Second time just to be safe...
#export CONDA_PREFIX=/srv/conda/envs/notebook

./configure --prefix=$CONDA_PREFIX/bropo \
            --with-rave=$CONDA_PREFIX/rave \
            --with-png=$CONDA_PREFIX
make
make test
make install

grep -l bropo ~/.bashrc
if [[ $? == 1 ]]; then
    echo "export PATH=\"\$PATH:$CONDA_PREFIX/bropo/bin\"" >> ~/.bashrc;
    echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/bropo/lib\"" >> ~/.bashrc;
fi
grep -l ropo_quality_plugin $CONDA_PREFIX/rave/etc/rave_pgf_quality_registry.xml
if [[ $? == 1 ]]; then
    sed -i 's/<\/rave-pgf-quality-registry>/  <quality-plugin name="ropo" module="ropo_quality_plugin" class="ropo_quality_plugin"\/>\n<\/rave-pgf-quality-registry>/g' $CONDA_PREFIX/rave/etc/rave_pgf_quality_registry.xml;
fi
