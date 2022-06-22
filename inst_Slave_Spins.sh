#Building scifor

#Errors
set -e

export PKG_CONFIG_PATH=~/.pkgconfig.d
#Sourcing .bashrc
source ~/.bashrc
#SCIFORVER=$( ls ~/opt/scifor/gnu)
#source ~/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh

#Correction based on GF-VER
#./GetGFversion.sh "Slave_Spins"

cd Slave_Spins
mkdir build
cd build

echo "cmake .."
cmake .. #-DUSE_MPI=no #Option for non parallelized

echo "make"
make

echo "make install"
make install

cd ../..

echo "\e[32m Slave_Spins succesfully installed \e[0m"

echo "source ~/opt/slave_spins/gnu/*/bin/slave_spins_config.sh" >> ~/.bashrc
