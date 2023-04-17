#!/bin/sh
#
# Generate events
#
# m.mieskolainen@imperial.ac.uk, 2023

source setenv.sh

mkdir output -p
cd src

# Make sure we point to the right Pythia 8 version (not some system default)
export PYTHIA8DATA="../pythia8309/share/Pythia8/xmldoc"

# Compile
source compile.sh
chmod +x p8gen

NEVENTS=100

# Simulate
for PROC in MinBias hardQCD ttbar Ztoee Ztomumu Ztoqqbar
do
  ./p8gen -c ../cards/${PROC}.cmnd  -o ../output/${PROC} -n ${NEVENTS}
done

cd ..
