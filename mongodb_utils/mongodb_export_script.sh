#!/bin/bash

DB_NAME="ap4000"
OUTPUT_DIR="/root"

# ایجاد دایرکتوری خروجی در صورت عدم وجود
mkdir -p $OUTPUT_DIR

# لیست کردن کالکشن‌ها و خروجی گرفتن از هر کدام
collections=$(mongo $DB_NAME --quiet --eval "db.getCollectionNames().join(' ')")

for collection in $collections; do
    mongoexport --db $DB_NAME --collection $collection --out "$OUTPUT_DIR/$collection.json"
done
