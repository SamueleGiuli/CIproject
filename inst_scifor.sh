#Building scifor
set -e

cd scifor
mkdir build
cd build
ls -r
cmake .. -DUSE_MPI=no
make
make install
cd ../..
SCIFORVER=$( ls /home/${USER}/opt/scifor/gnu)
echo "/home/${USER}/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh"
source /home/${USER}/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh
echo -e "\e[32m scifor succesfully installed \e[0m"
