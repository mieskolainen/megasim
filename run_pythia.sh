#!/bin/sh
#
# Generate events
#
# m.mieskolainen@imperial.ac.uk, 2023

source setenv.sh

mkdir output
cd src

# Compile
source compile.sh
chmod +x p8gen

NEVENTS=100000

# Simulate
for PROC in MinBias hardQCD ttbar Ztoee Ztomumu Ztoqqbar
do
  ./p8gen -c ../cards/${PROC}.cmnd  -o ../output/${PROC} -n ${NEVENTS}
done

cd ..
