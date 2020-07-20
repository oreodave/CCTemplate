#!/bin/bash

mkdir dist includes;
echo "" > README.org;
cd dist; cmake ..; cd ..;
rm -rfv start.sh LICENSE .git;
