#!/bin/bash

input_file=$1

if [ ! -f "$input_file" ]; then
  echo "input xml file not found"
  exit 1
fi

extract_title () {
  local IFS=<
  read -d \> tag content
  if [[ $tag == title* ]]; then
    echo $content
  fi
}

while extract_title; do
  :
done < "$input_file" > output.txt

echo "ok title tags content are stored in output.txt file "
echo "https://afash.ir/"