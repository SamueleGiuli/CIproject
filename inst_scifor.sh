#Building scifor

#Errors
set -e

#Sourcing .bashrc
source ~/.bashrc

#Correction based on GF-VER
./GetGFversion.sh "scifor"

cd scifor
mkdir build
cd build
cmake .. #-DUSE_MPI=no #Option for non parallelized
make
make install
cd ../..

SCIFORVER=$( ls ~/opt/scifor/gnu)
echo "source ~/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh" >> ~/.bashrc
echo -e "\e[32m scifor succesfully installed and sourced \e[0m"
