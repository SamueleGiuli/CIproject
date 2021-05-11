#Building scifor

#Errors
set -e

source ~/.bashrc
#export PATH=${PATH}:/home/${USER}/.openmpi/bin/
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/${USER}/.openmpi/lib/

ls
#Change in case of ver>=10.x.x
./GetGFversion.sh "scifor"

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
