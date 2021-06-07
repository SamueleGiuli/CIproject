#Building scifor

#Errors
set -e

#Checking that scifor properly links libraries (commor mistake in various OS)



cd Driver-Database

sed -i 's/^export GLOB_INC=.*/export GLOB_INC=\$( pkg-config --cflags dmft_ed dmft_tools scifor slave_spins)/' Makefile
sed -i "s/^export GLOB_LIB=.*/export GLOB_LIB=\$( pkg-config --libs   dmft_ed dmft_tools scifor slave_spins | sed  's/;/ /g'  | sed 's/\\/  /g' )/" Makefile

while read driver; do
    #sed che cambia EXE
    echo "Installing driver ${driver}"
    sed -i "s/^EXE=.*/EXE=${driver}/" Makefile
    echo "sed done"
    make
    echo "Succesfully installed ${driver}"
done < ../drivers_to_test.txt
cd ..
