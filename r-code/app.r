#!/usr/bin/env Rscript

# Установка deSolve:
# install.packages('deSolve', repos='http://probability.ca/cran')

# Запуск:
#  ./app.r parameters_filename
#  ./app.r

model <- "M1"								  # Текущая модель
pfile <- paste(model, "parms.txt",   sep="/") # Файл параметров по умолчанию

args  <- commandArgs(trailingOnly = TRUE)
if(length(args) > 0){ pfile <- args[1] }

source(pfile) 								 # Файл параметров
source(paste(model, "_init.r",   sep="/"))   # Инициализация, определение начального состояния системы
source(paste(model, "_matrix.r", sep="/"))   # Экспериментальные значения
source(paste(model, "_dydt.r",   sep="/"))   # Уравнение

library(deSolve)

times <- seq(0, 20, by = 0.1)
out <- ode(y = state, times = times, func = dydt, parms = NULL, method = "rk4")

pp_mrna_index <- (1 : (length(out[1,])/2-1/2)+1) # Извлекаем только pp{i}_mrna индексы
m <- out[seq(1, 210, by = 20),pp_mrna_index]

# cat( sum( (m - ex)^2 ) )
# Без учёта первой строки
cat( sum( (m[2:11,] - ex[2:11,])^2 ) )
cat("\n")
