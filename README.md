# megasim
## Pythia to HepMC to Delphes HEP-simulation chain

m.mieskolainen@imperial.ac.uk, 2023 </br>

## Preliminaries

### CMake

(If not already)
```
sudo apt install cmake
```

## Installation

### ROOT

(If not already)
```
cd $HOME/local

# Pick suitable pre-compiled ROOT (Ubuntu, Centos etc.)
wget https://root.cern/download/root_v6.28.02.Linux-ubuntu22-x86_64-gcc11.3.tar.gz
tar -xzvf root_v6.28.02.Linux-ubuntu22-x86_64-gcc11.3.tar.gz

# Setup environment
source $HOME/local/root/bin/thisroot.sh
```

### HepMC2
```
export HEPMC2=$HOME/local/HEPMC2

tar -xvf hepmc2.06.11.tgz
cd HepMC-2.06.11

./configure --with-momentum=GEV --with-length=MM --prefix=$HEPMC2/HepMC-2.06.11/build
make -j4
make install
```

### RIVET
(RESERVATION -- not needed) </br>
https://gitlab.com/hepcedar/rivet/-/blob/release-3-1-x/doc/tutorials/installation.md
```
export RIVET=$HOME/local/RIVET

mkdir -p scratch/rivet
cd scratch/rivet
wget https://gitlab.com/hepcedar/rivetbootstrap/raw/3.1.7/rivet-bootstrap
chmod +x rivet-bootstrap

INSTALL_PREFIX=$RIVET MAKE="make -j4" ./rivet-bootstrap
```

### PYTHIA 8
```
export PYTHIA8=$HOME/local/PYTHIA8

wget https://pythia.org/download/pythia83/pythia8309.tgz
tar -xzvf pythia8309.tgz
cd pythia8309

./configure --with-hepmc2=$HEPMC2/HepMC-2.06.11/build --prefix=$PYTHIA8/Pythia-8.3.09/build
make -j4
make install
```

### DELPHES 3
```
wget http://cp3.irmp.ucl.ac.be/downloads/Delphes-3.5.0.tar.gz
tar -zxf Delphes-3.5.0.tar.gz
cd Delphes-3.5.0

make -j4
```

## Simulation

### A. Event generation

```
source run_pythia.sh
```

### B. Delphes detector simulation

```
source run_delphes.sh
```

## Links and others

https://pythia.org/latest-manual/Welcome.html </br>
https://cp3.irmp.ucl.ac.be/projects/delphes  </br>
https://github.com/scikit-hep/pyhepmc </br>
https://gitlab.cern.ch/hepmc/HepMC3 </br>

See Delphes analysis ROOT-macro examples under `Delphes-3.5.0/examples`
