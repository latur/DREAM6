#!/bin/bash

TIMEOUT=290   # Ограничение времени работы DEEP
PSIZE=150     # Размер популяции (population_size)
MODEL=3       # Текущая модель (1,2,3)
COURSE=1      # Номер прогона алгоритма (для сознания файлов-отчётов)
ES=2          #

function eval {

	# Парсинг файла параметров для создания списка DEEP
	PARAMS=$(cat "M${MODEL}/parms.txt" | sed "s/=([0-9.]{1,11})/;1;/g" -r | tr -d "\n")
	PCOUNT=$(wc -l "M${MODEL}/parms.txt" | sed "s/ .*//g" -r)
	
	echo $PCOUNT;

	# Запуск: 
	cat settings.ini \
	 | sed "s/seed=([0-9]{1,11})/seed=$RANDOM/g" -r \
	 | sed "s/population_size=([0-9]{1,11})/population_size=${PSIZE}/g" -r \
	 | sed "s/es_lambda=([0-9]{1,11})/es_lambda=${ES}/g" -r \
	 | sed "s/parts=(.*)/parts=${PARAMS}/g" -r \
	 | sed "s/command=.\/app.r/command=.\/app.r M${MODEL}/g" -r \
	 | sed "s/numdparms=([0-9]{1,3})/numdparms=${PCOUNT}/g" -r \
	 | sed "s/numparms=([0-9]{1,3})/numparms=${PCOUNT}/g" -r \
	 | sed "s/nummask=([0-9]{1,3})/nummask=${PCOUNT}/g" -r \
	 | sed "s/numtweak=([0-9]{1,3})/numtweak=${PCOUNT}/g" -r \
	   > settings

	# DEEP 
	# Интервальный запуск (timeout)
	echo "---> Model: ${MODEL}; PSIZE: ${PSIZE}; ES:${ES}; COURSE:${COURSE}";
	timeout ${TIMEOUT}s dpdeepctl --default-name=settings 2> /dev/null

	# Обычный режим
	echo "Процесс идёт...";
	# dpdeepctl --default-name=settings 2> /dev/null

	# sleep 1s;
	echo "OK";

	# Перенос результата из "settings.hopt_log_0"
	cat settings.hopt_log_0 > "results/_result_m${MODEL}p${PSIZE}e${ES}t${COURSE}.log" 2> /dev/null
	rm -f settings.hopt_log_0
}

function evalmodel {
  for COURSE in `seq 1 20`;
    do
     let "ES = 2";  eval;
     let "ES = 15"; eval;
     let "ES = 45"; eval;
    done
  rm -f settings
}


MODEL=1
evalmodel
MODEL=2
evalmodel
MODEL=3
evalmodel
