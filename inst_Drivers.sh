#Building scifor

#Errors
set -e

#Sourcing .bashrc
source ~/.bashrc

#Sourcing .bashrc
source ~/.bashrc
SCIFORVER=$( ls ~/opt/scifor/gnu)
source ~/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh
DMFTVER=$( ls ~/opt/dmft_tools/gnu )
source ~/opt/dmft_tools/gnu/${DMFTVER}/bin/dmft_tools_config_user.sh




cd Driver-Database

while read driver; do
    #sed che cambia EXE
    sed -i "s/^EXE=.*/EXE=${driver} /" Makefile
    make
    echo "Succesfully installed ${driver}"
done < ../drivers_to_test.txt
cd ..
