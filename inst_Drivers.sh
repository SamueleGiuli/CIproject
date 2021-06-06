#Building scifor

#Errors
set -e

#Sourcing .bashrc
source ~/.bashrc


cd Driver-Database

for driver in (../driver_to_test.txt)
do
    #sed che cambia EXE
    sed -i "s/^EXE=.*/EXE=${driver} /" test.txt Makefile
    make
    echo "Succesfully installed ${driver}"
done
cd ..
