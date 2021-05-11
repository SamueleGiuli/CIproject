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
SCIFORVER=$( ls ~/opt/scifor/gnu)
echo "~/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh"
source ~/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh

echo "source ~/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh" >> ~/.bashrc

echo -e "\e[32m scifor succesfully installed and sourced \e[0m"
