#Building scifor
set -e

cd DMFTtools
mkdir build
cd build
ls -r
cmake ..
make
make install
cd ../..
echo "\e[32m DMFTtools succesfully installed \e[0m"
