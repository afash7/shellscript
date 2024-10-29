#!/bin/bash

# تنظیمات پایگاه داده
DB_NAME="نام_پایگاه_داده"
OUTPUT_DIR="/path/to/output"

# ایجاد پوشه خروجی در صورت عدم وجود
mkdir -p "$OUTPUT_DIR"

# دریافت لیست کالکشن‌ها
collections=$(mongo --quiet --eval "db.getCollectionNames()" "$DB_NAME")

# خروجی گرفتن از هر کالکشن
for collection in $collections; do
    echo "Exporting collection: $collection"
    mongoexport --db "$DB_NAME" --collection "$collection" --type=csv --fields $(mongo --quiet --eval "db.$collection.findOne().keySet().join(',')" "$DB_NAME") --out "$OUTPUT_DIR/$collection.csv"
done

echo "Export completed."
