#Building scifor

#Errors
set -e

#Sourcing .bashrc
SCIFORVER=$( ls /home/${USER}/opt/scifor/gnu)
echo "/home/${USER}/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh"
source /home/${USER}/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh

cd DMFTtools
mkdir build
cd build
ls -r
cmake .. #-DUSE_MPI=no
make
make install
cd ../..
DMFTVER=$( ls /home/${USER}/opt/dmft_tools/gnu )
echo "/home/${USER}/opt/dmft_tools/gnu/${DMFTVER}/bin/dmft_tools_config_user.sg"
echo "source /home/${USER}/opt/dmft_tools/gnu/${DMFTVER}/bin/dmft_tools_config_user.sg" >> /hom/${USER}/.bashrc
echo "\e[32m DMFTtools succesfully installed \e[0m"
