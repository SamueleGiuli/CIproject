#Code to run all tests in test/bin/
#N.B. test should end by .x

set -e

if [ ! -d "unittest/bin" ]
then
    echo "\e[31m ERROR \e[0m"
    echo " There is no test/bin directory"
    echo " Try  'make build' before testin"
    return 1
fi
    
cd unittest/bin/

for exe in *.x
do
    ./$exe 
done
    
    

