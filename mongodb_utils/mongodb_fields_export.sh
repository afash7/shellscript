#!/bin/bash

DB_NAME="ap4000"
OUTPUT_FILE="/root/fieldes_export.txt"

> "$OUTPUT_FILE"

collections=$(mongo $DB_NAME --quiet --eval "db.getCollectionNames().join(' ')")
echo "Collections: $collections"

for collection in $collections; do
    echo "Processing collection: $collection"
    document=$(mongo $DB_NAME --quiet --eval "db.$collection.findOne()")
    
    if [ "$document" != "null" ]; then
        fields=$(echo "$document" | jq 'keys' | tr -d '[],"')
        echo "$collection: $fields" >> "$OUTPUT_FILE"
    else
        echo "$collection: empty" >> "$OUTPUT_FILE"
    fi
done

echo "Field extraction completed. Check the '$OUTPUT_FILE' for results."
