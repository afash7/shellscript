#!/bin/bash

touch output.txt

for dir1 in */
do
  for dir2 in */
  do
    if [ "$dir1" != "$dir2" ]; then
      if [[ $dir1 == *"$dir2"* ]]; then
        echo $dir1 >> output.txt
        break
      fi
    fi
  done
done