#!/bin/bash

# Convert all video files to mp3 in the current directory
for file in *.{mp4,avi,mkv}; do
    ffmpeg -i "$file" -vn -acodec libmp3lame -q:a 2 "${file%.*}.mp3"
done

