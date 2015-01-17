#!/bin/bash

TIMEOUT=855   # Ограничение времени работы DEEP
PSIZE=150     # Размер популяции (population_size)
MODEL=1       # Текущая модель (1,2,3)
COURSE=1      # Номер прогона алгоритма (для сознания файлов-отчётов)

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
	
	# DEEP 
	echo "---> Model: ${MODEL}; PSIZE: ${PSIZE}; ES:${ES}; COURSE:${COURSE}";
	timeout ${TIMEOUT}s dpdeepctl --default-name=settings 2> /dev/null
	sleep 1s;
	echo "OK";

	# Перенос результата из "settings.hopt_log_0"
	cat settings.hopt_log_0 > "results/_result_m${MODEL}p${PSIZE}e${ES}t${COURSE}.log" 2> /dev/null
	rm -f settings.hopt_log_0
}

# ES - Замена индивидуумов (es_lambda)
for COURSE in `seq 1 20`;
  do 
   let "ES = 2"; eval;
   let "ES = 15"; eval;
   let "ES = 45"; eval;
  done

rm -f settings
