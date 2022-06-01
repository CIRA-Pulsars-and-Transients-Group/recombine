#!/usr/bin/env bash
# VERSION is... the version of the software. This could be hard-coded, or you could determine it from something else.# The following git branches, if possible.
if ! git branch | grep "\\*" | grep "detached"; then
    VERSION=$(git branch | grep "\\*" | cut -d" " -f2-)
elif git describe --tags &> /dev/null; then
    VERSION=$(git describe --tags)
else
    VERSION=$(git branch | grep "\\*" | grep "detached" | rev | cut -d" " -f1 | rev | sed "s|)||")
fi

#Manualy change the version here if necessary
VERSION=main

ROOT=/pawsey/mwa/software/python3/
PACKAGE=recombine
PREFIX=$ROOT/$PACKAGE/$PACKAGE

set -eux

#install recombine
module load gcc/8.3.0
module load cfitsio

cd $PREFIX/src

CXX=`which g++`
CXX_FLAGS="-O3 -ftree-loop-distribution -funroll-all-loops -fdata-sections -fstack-protector"
${CXX} -c ${CXX_FLAGS} -I${CFITSIO_ROOT}/include main.cpp -o main.o
${CXX} -c ${CXX_FLAGS} -I${CFITSIO_ROOT}/include recombine.cpp -o recombine.o
${CXX} ${CXX_FLAGS} main.o recombine.o -o recombine -L${CFITSIO_ROOT}/lib -L/usr/lib64 -lcfitsio -lcurl

install -m 775 -D -t $ROOT/$PACKAGE/$VERSION/bin recombine
