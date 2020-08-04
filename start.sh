#!/bin/bash

mkdir dist includes;
echo "" > README.org;
rm -rfv start.sh LICENSE start.el;

# Now for the hard part
if [[ $1 == "cpp" ]]
then
    sed -i 's/\*\.c/*.cpp/g;s/\*\.h/*.hpp/g;s/\${THIS} C/${THIS} CXX/g;' CMakeLists.txt;
    rm src/main.c;
    echo "#include<iostream>

using std::cout;
using std::endl;

int main()
{
  cout << \"Hello, world!\" << endl;
  return 0;
}" > src/main.cpp
fi
if [ $# -eq 2 ]
then
    sed -i "s/main/$2/g" CMakeLists.txt;
    sed -i "s/main/$2/g" Makefile;
fi
cd dist; cmake ..; cd ..;
