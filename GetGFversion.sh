#Getting gfortran version
touch GF-version.txt
GFVER=$(gfortran --version | head -n1)
GFVER=${GFVER##* }

echo $GFVER

GF_CHAR=$( echo $GFVER | head -c 2  | tail -c 1)
echo "GFCHAR= $GF_CHAR"
#Change if gfver>=10.x.x
if [ "$GF_CHAR" = "." ]
then
    echo "gfortran version: $GFVER < 10.x.x"
else
    sed -i 's/-cpp -ffree-line-length-none/-cpp -ffree-line-length-none  -w -fallow-argument-mismatch/g' $1/CMakeLists.txt
fi
