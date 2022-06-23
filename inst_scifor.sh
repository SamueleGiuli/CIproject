#Building scifor

#Errors
set -e

#Sourcing .bashrc
source ~/.QcmP_source

#Correction based on GF-VER
#./GetGFversion.sh "scifor"

cd scifor
mkdir build
cd build

echo "cmake .."
cmake .. #-DUSE_MPI=no #Option for non parallelized

echo "make"
make

echo "make install"
make install

cd ../..

#SCIFORVER=$( ls ~/opt/scifor/gnu)
echo "source ~/opt/scifor/gnu/*/bin/scifor_config_user.sh" >> ~/.QcmP_source
echo -e "\e[32m scifor succesfully installed and sourced \e[0m"

echo "QcmP_source:"
cat ~/.QcmP_source
