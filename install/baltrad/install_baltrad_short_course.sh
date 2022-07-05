#!/usr/bin/env bash
set -x

# download and install course notebooks
cd $BALTRAD_INSTALL_ROOT/tmp
git clone --depth=1 https://github.com/DanielMichelson/baltrad_short_course.git
mv baltrad_short_course $BALTRAD_INSTALL_ROOT/notebooks/.
git clone --depth=1 https://github.com/DanielMichelson/baltrad2wradlib.git
mv baltrad2wradlib $BALTRAD_INSTALL_ROOT/notebooks/.
git clone --depth=1 https://github.com/DanielMichelson/pyart2baltrad.git
mv pyart2baltrad $BALTRAD_INSTALL_ROOT/notebooks/.
