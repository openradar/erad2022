#!/usr/bin/env bash
set -x

# needed for environment variables
conda activate $RADARENV

# needed to find dependencies
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib

# install beamb from source
cd ~
if [ ! -d tmp ]; then
    mkdir tmp
fi
cd tmp
git clone --depth=1 https://github.com/baltrad/beamb.git
cd beamb/

./configure --prefix=$CONDA_PREFIX/beamb --with-rave=$CONDA_PREFIX/rave
make
make test
make install
echo $CONDA_PREFIX/beamb/share/beamb/pybeamb > $CONDA_PREFIX/lib/python3.9/site-packages/beamb.pth

grep -l beamb ~/.bashrc
if [[ $? == 1 ]] ;
then 
echo "export PATH=\"\$PATH:$CONDA_PREFIX/beamb/bin\"" >> ~/.bashrc;
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/beamb/lib\"" >> ~/.bashrc;
fi
grep -l beamb $CONDA_PREFIX/rave/etc/rave_pgf_quality_registry.xml
if [ $? == 1 ] ;
then 
sed -i 's/<\/rave-pgf-quality-registry>/  <quality-plugin name="beamb" module="beamb_quality_plugin" class="beamb_quality_plugin"\/>\n<\/rave-pgf-quality-registry>/g' $CONDA_PREFIX/rave/etc/rave_pgf_quality_registry.xml;
fi
