#!/bin/bash
# Clone fdfpp from git repo, build and install fdfpp development libraries
# and python module

set -e

# Binaries
GIT=/usr/bin/git
PYTHON=/usr/bin/python

# Build directory
BUILD_DIR_BASE=${HOME}/build
BUILD_DIR=${HOME}/build/fdfpp

# Matplotlib location
FDFPP_URL="https://github.com/jerahmie/fdfpp.git"


if [ -d "$BUILD_DIR_BASE" ]; then
    cd $BUILD_DIR_BASE
else
    mkdir -p  $BUILD_DIR_BASE
    cd $BUILD_DIR_BASE
fi

if [ -d "$BUILD_DIR" ]; then
    cd $BUILD_DIR
    $GIT pull
else
    $GIT clone $FDFPP_URL fdfpp
    cd $BUILD_DIR
fi

# Build and install
$PYTHON setup.py build_ext --inplace  || { echo "FDFPP build failed."; exit 1; }
# sudo $PYTHON setup.py install || { echo "FDFPP install failed."; exit 1; }
