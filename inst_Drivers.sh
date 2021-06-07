#Building scifor

#Errors
set -e

#Checking that scifor properly links libraries (commor mistake in various OS)

if [! -d $HOME/.bin];then mkdir $HOME/.bin; fi

cd Driver-Database

sed -i "s~^GLOB_LIB:=.*~GLOB_LIB:=\$( pkg-config --libs   dmft_ed dmft_tools scifor | sed  \"s/;/ /g\"  | sed 's/\\\\/  /g' )~" Makefile

while read driver; do
    #sed che cambia EXE
    echo "Installing driver ${driver}"
    sed -i "s/^EXE=.*/EXE=${driver}/" Makefile
    echo "sed done"
    make
    echo "Succesfully installed ${driver}"
done < ../drivers_to_test.txt
cd ..
