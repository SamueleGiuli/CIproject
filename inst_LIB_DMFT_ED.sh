#Building scifor
set -e

cd LIB_DMFT_ED
mkdir build
cd build
ls -r
cmake ..
make
make install
cd ../..
echo "\e[32m LIB_DMFT_ED succesfully installed \e[0m"
