
HEPMC2_PATH=$HOME/local/HEPMC2/HepMC-2.06.11/build
PYTHIA8_PATH=$HOME/local/PYTHIA8/Pythia-8.3.09/build

g++ p8gen.cc -o p8gen \
    -O2 -pedantic -W -Wall -Wshadow -fPIC -w \
    -I$HEPMC2_PATH/include -I$PYTHIA8_PATH/include \
    -L$HEPMC2_PATH/lib -L$PYTHIA8_PATH/lib \
    -Wl,-rpath,$HEPMC2_PATH/lib  -Wl,-rpath,$PYTHIA8_PATH/lib -Wl,-rpath,./ \
    -lpythia8 -lHepMC -ldl -std=c++14

# -lHepMCfio # Adding this might cause problem
# -I$RIVETSYS/include -L$RIVETSYS/lib -lRivet
