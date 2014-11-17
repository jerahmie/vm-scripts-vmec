#!/bin/bash
# python3-matplotlib not available on Debian Wheezy (stable)
# Download, build, and install Matplot for Python3

# Binaries
GIT=/usr/bin/git
PYTHON3=/usr/bin/python3

# Build directory
BUILD_DIR_BASE=${HOME}/build
BUILD_DIR=${HOME}/build/matplotlib

# Matplotlib location
MATPLOT_LIB_URL="https://github.com/matplotlib/matplotlib/matplotlib.git"


if [ -d "$BUILD_DIR" ]; then
    cd $BUILD_DIR_BASE
else
    mkdir -p  $BUILD_DIR_BASE
    cd $BUILD_DIR_BASE
fi

$GIT clone $MATPLOT_LIB_URL matplotlib
cd ${BUILD_DIR}


