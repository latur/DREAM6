#!/bin/bash

TIMEOUT=2000  # Время, предоставляемое программе
MODEL=1       # Текущая модель (1,2,3)
PSIZE=280     # Размер популяции (population_size)
ES=14         # Замена индивидуумов (es_lambda)

function eval {

	# Парсинг файла параметров для создания списка DEEP
	PARAMS=$(cat "M${MODEL}/parms.txt" | sed "s/=([0-9.]{1,11})/;1;/g" -r | tr -d "\n")

	# Запуск: 
	cat settings.ini \
	 | sed "s/seed=([0-9]{1,11})/seed=$RANDOM/g" -r \
	 | sed "s/population_size=([0-9]{1,11})/population_size=${PSIZE}/g" -r \
	 | sed "s/es_lambda=([0-9]{1,11})/es_lambda=${ES}/g" -r \
	 | sed "s/parts=(.*)/parts=${PARAMS}/g" -r \
	 | sed "s/command=.\/app.r/command=.\/app.r M${MODEL}/g" \
	   > settings
	
	timeout ${TIMEOUT}s dpdeepctl --default-name=settings

	# Сохранение результата из "settings.hopt_log_0"
	cat settings.hopt_log_0 > "_result_M${MODEL}_ps${PSIZE}.es${ES}.log";
}

# PSIZE: 60 80 100 ... -> 300
# ES:    3  4  5   ... -> 300/20=15

for ES in `seq 3 10`;
  do let "PSIZE = (ES * 20)"
     eval
  done 
