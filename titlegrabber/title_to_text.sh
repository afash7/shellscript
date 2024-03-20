#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Usage: bash xml_title.sh input.xml output.txt"
  exit 1
fi

xml_file=$1

output_file=$2

if [ ! -f "$xml_file" ]; then
  echo "File $xml_file does not exist."
  exit 2
fi

if [ -f "$output_file" ]; then
  rm "$output_file"
fi

while read -r line; do
  if [[ $line =~ \<title\>(.*)\</title\> ]]; then
    echo "${BASH_REMATCH[1]}" >> "$output_file"
  fi
done < "$xml_file"

echo "The program finished successfully. The output file is $output_file."

echo "https://afash.ir"