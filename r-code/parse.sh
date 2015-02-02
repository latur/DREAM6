#!/bin/bash

# Формирование из log файлов таблицы: 
# Время работы, tao, значение F (функционлала качества)
archive='methods';

name='results/_result'
for fn in $name*.log;
do 
  cat $fn \
   | sed "s/ p\[[0-9]{1,2}\]:/,/g" -r \
   | sed "s/wtime://g" -r \
   | sed "s/ tau:/,/g" -r \
   | sed "s/ cost:/,/g" -r \
     > /tmp/results;
  cat /tmp/results > "$fn.dev";
done 

# Упаковка
rm -f results/*.zip
zip results/$archive.dev.zip $name*.dev
zip results/$archive.csv.zip $name*.log
rm -f $name*.dev
