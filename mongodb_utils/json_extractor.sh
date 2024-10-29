#!/bin/bash

DB_NAME="ap4000"
OUTPUT_FILE="/root/output.json"  

echo "{" > "$OUTPUT_FILE"
echo "\"collections\": [" >> "$OUTPUT_FILE"

collections=$(mongo $DB_NAME --quiet --eval "db.getCollectionNames().join(' ')")
first_collection=true

for collection in $collections; do
    documents=$(mongo $DB_NAME --quiet --eval "JSON.stringify(db.$collection.find().toArray())")

    if [ "$documents" != "null" ] && [ "$documents" != "[]" ]; then
        if [ "$first_collection" = true ]; then
            first_collection=false
        else
            echo "," >> "$OUTPUT_FILE"
        fi

        echo "  {\"collection\": \"$collection\", \"documents\": $documents}" >> "$OUTPUT_FILE"
    fi
done

echo "]" >> "$OUTPUT_FILE"
echo "}" >> "$OUTPUT_FILE"

echo "Field extraction completed. Check the '$OUTPUT_FILE' for results."
