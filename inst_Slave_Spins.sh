#Building scifor

#Errors
set -e

#Sourcing .bashrc
source ~/.bashrc
SCIFORVER=$( ls ~/opt/scifor/gnu)
source ~/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh

#Correction based on GF-VER
./GetGFversion.sh "Slave_Spins"

cd Slave_Spins
mkdir build
cd build
cmake .. #-DUSE_MPI=no #Option for non parallelized
make
make install
cd ../..

echo "\e[32m Slave_Spins succesfully installed \e[0m"
