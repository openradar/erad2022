#!/usr/bin/env bash
# show commands before execution
set -x

# do not fail GHA on nonzero exit status
set +e

# needed to find dependencies
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib

# download
cd $BALTRAD_INSTALL_ROOT/tmp
git clone --depth=1 https://github.com/baltrad/beamb.git
cd beamb/

# build, test and install
./configure --prefix=$CONDA_PREFIX/beamb --with-rave=$CONDA_PREFIX/rave
make
make test
make install
echo $CONDA_PREFIX/beamb/share/beamb/pybeamb > $CONDA_PREFIX/lib/python3.9/site-packages/beamb.pth

# activation script
grep -l beamb ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
if [[ $? == 1 ]] ;
then
echo "export PATH=\"\$PATH:$CONDA_PREFIX/beamb/bin\"" >> ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/beamb/lib\"" >> ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
fi

# plugin
grep -l beamb $CONDA_PREFIX/rave/etc/rave_pgf_quality_registry.xml
if [ $? == 1 ] ;
then 
sed -i 's/<\/rave-pgf-quality-registry>/  <quality-plugin name="beamb" module="beamb_quality_plugin" class="beamb_quality_plugin"\/>\n<\/rave-pgf-quality-registry>/g' $CONDA_PREFIX/rave/etc/rave_pgf_quality_registry.xml;
fi
