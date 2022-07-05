#!/usr/bin/env bash
set -x

# needed to find dependencies
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib

# download
cd $BALTRAD_INSTALL_ROOT/tmp
git clone --depth 1 https://github.com/baltrad/bropo.git
cd bropo/

# build, test and install
./configure --prefix=$CONDA_PREFIX/bropo \
            --with-rave=$CONDA_PREFIX/rave \
            --with-png=$CONDA_PREFIX
make
make test
make install

# activation script
grep -l bropo ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
if [[ $? == 1 ]]; then
    echo "export PATH=\"\$PATH:$CONDA_PREFIX/bropo/bin\"" >> ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
    echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/bropo/lib\"" >> ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
fi

# plugin
grep -l ropo_quality_plugin $CONDA_PREFIX/rave/etc/rave_pgf_quality_registry.xml
if [[ $? == 1 ]]; then
    sed -i 's/<\/rave-pgf-quality-registry>/  <quality-plugin name="ropo" module="ropo_quality_plugin" class="ropo_quality_plugin"\/>\n<\/rave-pgf-quality-registry>/g' $CONDA_PREFIX/rave/etc/rave_pgf_quality_registry.xml;
fi
