#!/bin/sh

set -e

export DH_VERBOSE=1 

cd pkg/libhdf5-static-pic
dpkg-buildpackage -b

