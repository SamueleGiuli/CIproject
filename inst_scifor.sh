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
echo "\e[32m scifor succesfully installed \e[0m"
