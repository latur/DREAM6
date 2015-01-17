#!/bin/bash

# Формирование из log файлов таблицы: 
# Время работы, tao, значение F (функционлала качества)

for fn in results/_result*.log;
  do 
    cat $fn \
     | sed "s/ p(.*)//g" -r \
     | sed "s/wtime://g" -r \
     | sed "s/ tau:/,/g" -r \
     | sed "s/ cost:/,/g" -r \
       > /tmp/results;
    cat /tmp/results > "$fn.dev"
  done 

rm -f results/exports.zip
zip results/exports.zip results/_result*.dev
rm -f results/_result*.dev

#rm -f results/_result*.log
