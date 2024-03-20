#! /usr/bin/bash

if [ $# -eq 0 ]; then
  echo "insert text fil: "
  exit 1
fi

if [ ! -f $1 ]; then
  echo "file does not exist! "
  exit 2
fi

while read line; do
  mkdir "$line"
done < $1

echo "directories are created"

echo "Afash"
