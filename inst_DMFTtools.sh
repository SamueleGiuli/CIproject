#Building scifor

#Errors
set -e


#Sourcing .bashrc
source ~/.bashrc
SCIFORVER=$( ls ~/opt/scifor/gnu)
source ~/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh

#Correction based of GF-VER
./GetGFversion.sh "DMFTtools"



cd DMFTtools
mkdir build
cd build
cmake .. #-DUSE_MPI=no #Option for non parallelized
make
make install
cd ../..

DMFTVER=$( ls ~/opt/dmft_tools/gnu )
echo "source ~/opt/dmft_tools/gnu/${DMFTVER}/bin/dmft_tools_config_user.sh" >> ~/.bashrc
echo "\e[32m DMFTtools succesfully installed \e[0m"
