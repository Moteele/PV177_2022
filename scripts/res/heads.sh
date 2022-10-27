#!/bin/bash

# tento skript vezme cely podadresar a ke kazdemu souboru vygeneruje verzi, ve ktere je jen prvnich 10 souboru
FILE="./allitems.headonly"
rm $FILE

DIR="./res"
rm -rf $DIR
mkdir $DIR

