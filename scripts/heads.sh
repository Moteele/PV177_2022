#!/bin/bash

# tento skript vezme cely podadresar a ke kazdemu souboru vygeneruje verzi, ve ktere je jen prvnich 10 souboru
FILE="./allitems.headonly"
rm $FILE

DIR="./res"
rm -rf $DIR
mkdir $DIR

for ITEM in $(find . -type f -not -name "*.headonly" -not -name "*.gz" -not -name "*.gzip" -not -name "*.zip") ; do 
	head "$ITEM" > "$ITEM".headonly;
	
	echo "FILE: $ITEM" >> $FILE;
	head "$ITEM" >> $FILE;
	echo "" >> $FILE;
	echo "" >> $FILE;

	head "$ITEM" > "$DIR/`basename $ITEM`";
done;
