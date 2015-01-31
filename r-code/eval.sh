#!/bin/bash

TIMEOUT=800       # Ограничение времени работы DEEP
PSIZE=120         # Размер популяции (population_size)
MODEL=1           # Текущая модель (1,2,3)
COURSE=1          # Номер прогона алгоритма (для сознания файлов-отчётов)
ES=2              #
RECS='de_3_bin_T' # recombination_strategy (simple | de_3_bin | de_3_exp | de_3_exp_T | de_3_bin_T)

function eval {
	# Парсинг файла параметров для создания списка DEEP
	PARAMS=$(cat "M${MODEL}/parms.txt" | sed "s/=([0-9.]{1,11})/;1;/g" -r | tr -d "\n")
	PCOUNT=$(wc -l "M${MODEL}/parms.txt" | sed "s/ .*//g" -r)

	# Запуск: 
	cat settings.ini \
	 | sed "s/seed=([0-9]{1,11})/seed=$RANDOM/g" -r \
	 | sed "s/population_size=([0-9]{1,11})/population_size=${PSIZE}/g" -r \
	 | sed "s/es_lambda=([0-9]{1,11})/es_lambda=${ES}/g" -r \
	 | sed "s/parts=(.*)/parts=${PARAMS}/g" -r \
	 | sed "s/recombination_strategy=(.*)/recombination_strategy=${RECS}/g" -r \
	 | sed "s/command=.\/app.r/command=.\/app.r M${MODEL}/g" -r \
	 | sed "s/numdparms=([0-9]{1,3})/numdparms=${PCOUNT}/g" -r \
	 | sed "s/numparms=([0-9]{1,3})/numparms=${PCOUNT}/g" -r \
	 | sed "s/nummask=([0-9]{1,3})/nummask=${PCOUNT}/g" -r \
	 | sed "s/numtweak=([0-9]{1,3})/numtweak=${PCOUNT}/g" -r \
	   > settings

	# DEEP 
	# Интервальный запуск (timeout)
	echo "---> Model: ${MODEL}; PSIZE: ${PSIZE}; ES:${ES}; COURSE:${COURSE}; RECS:${RECS}";
	timeout ${TIMEOUT}s dpdeepctl --default-name=settings 2> /dev/null

	# Обычный режим
	# echo "Процесс идёт...";
	# dpdeepctl --default-name=settings 2> /dev/null

	# sleep 1s;
	echo "OK";

	# Перенос результата из "settings.hopt_log_0"
	# cat settings.hopt_log_0 > "results/_result_m${MODEL}p${PSIZE}e${ES}_${RECS}t${COURSE}.log" 2> /dev/null
	# rm -f settings.hopt_log_0
}

function evalmodel {
  for COURSE in `seq 1 10`;
    do
     RECS="de_3_bin_T"; eval;
     RECS="de_3_exp_T"; eval;
     RECS="de_3_exp";   eval;
     RECS="de_3_bin";   eval;
     RECS="simple";     eval;
    done
  # rm -f settings
}

# 3 модели, 10раз, 5вариантов, TIMEOUT для каждого
let time=$(($TIMEOUT*3*10*5/60))
let htime=$((time/60))
echo "Планируемое время работы: ${time}мин (${htime} часов). Продолжить? [y/n]"
read rec
if [[ $rec == "y" ]];
  then for MODEL in `seq 1 3`; do evalmodel; done;
  else echo "Процесс прерван"; 
fi
