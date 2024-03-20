#!/bin/bash

read -p " input xml file name: " xml_file

if [ -f "$xml_file" ]; then
    grep -oP "(?<=<title>).*?(?=</title>)" "$xml_file" > output.txt
    sed -i 's/[<!\[\]CDATA>]//g' output.txt
    echo "OK visit me: https://afash.ir/  :) "
else
    echo "XML file not found"
fi