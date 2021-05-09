#Building scifor

#Errors
set -e

source ~/.bashrc

cd scifor
mkdir build
cd build
ls -r
cmake .. #-DUSE_MPI=no
make
make install
cd ../..
SCIFORVER=$( ls /home/${USER}/opt/scifor/gnu)
echo "/home/${USER}/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh"
source /home/${USER}/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh

echo "source /home/${USER}/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh" >> /home/${USER}/.bashrc

echo -e "\e[32m scifor succesfully installed and sourced \e[0m"
