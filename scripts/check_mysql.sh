#!/bin/bash

DB_USER=root
# DB_PW=
# DB_NAME=

echo "\n\n## データベース一覧"
mysql -u$DB_USER -p$DB_PW -e "SHOW DATABASES";


echo "\n\n## テーブル一覧"
for i in $(mysql -u$DB_USER -p$DB_PW -D$DB_NAME -e 'SHOW TABLES' | grep -v "Tables_in" | awk '{print $1}')
do
  echo "\n\nTable: $i"
  mysql -u$DB_USER -p$DB_PW -D$DB_NAME -e "DESC $i"
done


echo "\n\n## 各テーブルの容量"
mysql -u $DB_USER -p$DB_PW $DB_NAME -e "SELECT table_name, engine, table_rows, avg_row_length, floor((data_length+index_length)/1024/1024) as allMB, floor((data_length)/1024/1024) as dMB, floor((index_length)/1024/1024) as iMB FROM information_schema.tables WHERE table_schema=database() ORDER BY (data_length+index_length) DESC;"


echo "\n\n## インデックス一覧"
for i in $(mysql -u$DB_USER -p$DB_PW -D$DB_NAME -e 'SHOW TABLES' | grep -v "Tables_in" | awk '{print $1}')
do
  echo "\n\nTable: $i"
  mysql -u$DB_USER -p$DB_PW -D$DB_NAME -e "SHOW INDEX FROM $i"
done
