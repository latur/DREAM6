#!/bin/bash

# Формирование из log файлов таблицы: 
# Время работы, tao, значение F (функционлала качества)

name='results/_result_m'
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

rm -f results/export.zip
zip results/export.zip $name*.dev
rm -f $name*.dev
