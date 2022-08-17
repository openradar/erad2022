#!/usr/bin/env bash
# show commands before execution
set -x

# do not fail GHA on nonzero exit status
set +e

# enter build directory
cd $BALTRAD_INSTALL_ROOT

# remove tmp folder (needed for local builds)
rm -rf $BALTRAD_INSTALL_ROOT/tmp

# create tmp folder
mkdir tmp

# create baltrad activation script for conda environment
touch ${CONDA_PREFIX}/etc/conda/activate.d/baltrad.sh
ls -lart ${CONDA_PREFIX}/etc/conda/activate.d/

# install baltrad components in correct order, output to log files
${CONDA_PREFIX}/bin/bash -l $BALTRAD_INSTALL_ROOT/install/baltrad/install_baltrad_hlhdf.sh 2>&1 |tee $BALTRAD_INSTALL_ROOT/tmp/install_baltrad_hlhdf.log
${CONDA_PREFIX}/bin/bash -l $BALTRAD_INSTALL_ROOT/install/baltrad/install_baltrad_rave.sh 2>&1 |tee $BALTRAD_INSTALL_ROOT/tmp/install_baltrad_rave.log
${CONDA_PREFIX}/bin/bash -l $BALTRAD_INSTALL_ROOT/install/baltrad/install_baltrad_beamb.sh 2>&1 |tee $BALTRAD_INSTALL_ROOT/tmp/install_baltrad_beamb.log
${CONDA_PREFIX}/bin/bash -l $BALTRAD_INSTALL_ROOT/install/baltrad/install_baltrad_bropo.sh 2>&1 |tee $BALTRAD_INSTALL_ROOT/tmp/install_baltrad_bropo.log
${CONDA_PREFIX}/bin/bash -l $BALTRAD_INSTALL_ROOT/install/baltrad/install_baltrad_wrwp.sh 2>&1 |tee $BALTRAD_INSTALL_ROOT/tmp/install_baltrad_wrwp.log
${CONDA_PREFIX}/bin/bash -l $BALTRAD_INSTALL_ROOT/install/baltrad/install_baltrad_drqc.sh 2>&1 |tee $BALTRAD_INSTALL_ROOT/tmp/install_baltrad_drqc.log
${CONDA_PREFIX}/bin/bash -l $BALTRAD_INSTALL_ROOT/install/baltrad/install_baltrad_rave_gmap.sh 2>&1 |tee $BALTRAD_INSTALL_ROOT/tmp/install_baltrad_rave_gmap.log
${CONDA_PREFIX}/bin/bash -l $BALTRAD_INSTALL_ROOT/install/baltrad/install_baltrad_short_course.sh 2>&1 |tee $BALTRAD_INSTALL_ROOT/tmp/install_baltrad_short_course.log
