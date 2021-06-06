#Building scifor

#Errors
set -e

#Sourcing .bashrc
source ~/.bashrc


cd Driver-Database

while read driver; do
    #sed che cambia EXE
    sed -i "s/^EXE=.*/EXE=${driver} /" test.txt Makefile
    make
    echo "Succesfully installed ${driver}"
done < ../drivers_to_test.txt done
cd ..
