#Building scifor

#Errors
set -e

#export PKG_CONFIG_PATH=~/.pkgconfig.d
#Sourcing .bashrc
source ~/.bashrc
#SCIFORVER=$( ls ~/opt/scifor/gnu)
#source ~/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh
#DMFTVER=$( ls ~/opt/dmft_tools/gnu )
#source ~/opt/dmft_tools/gnu/${DMFTVER}/bin/dmft_tools_config_user.sh

#Correction based on GF-VER
#./GetGFversion.sh "LIB_DMFT_ED"

cd LIB_DMFT_ED
mkdir build
cd build

echo "cmake .."
cmake .. #-DUSE_MPI=no #Option for non parallelized

echo "make"
make

echo "make install"
make install

cd ../..

echo "  source ~/opt/dmft_ed/gnu/*/bin/dmft_ed_config_user.sh" >> ~/.bashrc
echo "\e[32m LIB_DMFT_ED succesfully installed \e[0m"
