#Building scifor

#Errors
set -e

source ~/.bashrc
export PATH=${PATH}:/home/${USER}/.openmpi/bin/
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/${USER}/.openmpi/lib/


#Sourcing .bashrc
SCIFORVER=$( ls /home/${USER}/opt/scifor/gnu)
echo "/home/${USER}/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh"
source /home/${USER}/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh


cd LIB_DMFT_ED
mkdir build
cd build
ls -r
cmake .. -DUSE_MPI=no
make
make install
cd ../..
echo "\e[32m LIB_DMFT_ED succesfully installed \e[0m"
