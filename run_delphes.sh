#!/bin/sh
#
# Run Delphes simulations
#
# m.mieskolainen@imperial.ac.uk, 2023

source setenv.sh

cd Delphes-3.5.0

# Convert the pile-up events
# [hepmc2pileup output.pileup input.hepmc]
./hepmc2pileup ../output/MinBias.pileup ../output/MinBias.hepmc

# Simulate the process with pile-up included
# [DelphesHepMC2 tcl-card root-output hepmc2-input]

TCL=CMS_PhaseII_200PU_v04_new

for PROC in hardQCD ttbar Ztoee Ztomumu Ztoqqbar
do
  ./DelphesHepMC2 ../cards/CMS_PhaseII/${TCL}.tcl ../output/${PROC}-${TCL}.root ../output/${PROC}.hepmc
done

cd ..
