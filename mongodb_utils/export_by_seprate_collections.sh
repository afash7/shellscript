#!/bin/bash

DB_NAME="ap4000"
OUTPUT_DIR="/root/seprate"

mkdir -p "$OUTPUT_DIR"

collections=$(mongo $DB_NAME --quiet --eval "db.getCollectionNames().join(' ')")

for collection in $collections; do
    documents=$(mongo $DB_NAME --quiet --eval "JSON.stringify(db.$collection.find().toArray())")

    if [ "$documents" != "null" ] && [ "$documents" != "[]" ]; then
        echo "$documents" > "$OUTPUT_DIR/$collection.json"
        echo "Saved $collection to $OUTPUT_DIR/$collection.json"
    else
        echo "Collection $collection is empty, skipping."
    fi
done

echo "Extraction completed. Check the '$OUTPUT_DIR' for results."
