#Building scifor

#Errors
set -e

#Sourcing .bashrc
source /home/${USER}/.bashrc

cd LIB_DMFT_ED
mkdir build
cd build
ls -r
cmake .. -DUSE_MPI=no
make
make install
cd ../..
echo "\e[32m LIB_DMFT_ED succesfully installed \e[0m"
