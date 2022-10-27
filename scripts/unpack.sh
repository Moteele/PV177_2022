#/bin/bash

# find all .zip, .rar, .gz, .7z files and unzip them accordingly

for ITEM in $(find . -name "*.zip"); do
	unzip "$ITEM";
done;

for ITEM in $(find . -name "*.rar"); do
	unrar "$ITEM";
done;

for ITEM in $(find . -name "*.tar.gz"); do
	tar -xf "$ITEM";
done;

for ITEM in $(find . -name "*.7z"); do
	7z x "$ITEM";	
done;


