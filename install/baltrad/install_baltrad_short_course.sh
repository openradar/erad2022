#!/usr/bin/env bash
# show commands before execution
set -x

# do not fail GHA on nonzero exit status
set +e

# download and install course notebooks, overwrite in any case
cd $BALTRAD_INSTALL_ROOT/tmp
git clone --depth=1 https://github.com/DanielMichelson/baltrad_short_course.git
yes | cp -rf baltrad_short_course $BALTRAD_INSTALL_ROOT/notebooks/.
yes | rm -rf baltrad_short_course
git clone --depth=1 https://github.com/DanielMichelson/baltrad2wradlib.git
yes | cp -rf baltrad2wradlib $BALTRAD_INSTALL_ROOT/notebooks/.
yes | rm -rf baltrad2wradlib
git clone --depth=1 https://github.com/DanielMichelson/pyart2baltrad.git
yes | cp -rf pyart2baltrad $BALTRAD_INSTALL_ROOT/notebooks/.
yes | rm -rf pyart2baltrad
