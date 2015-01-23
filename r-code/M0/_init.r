# Вектор состояния системы
state <- c()
state["pp1_mrna"] <- 0
state["pp2_mrna"] <- 0
state["pp3_mrna"] <- 0
state["pp4_mrna"] <- 0
state["pp5_mrna"] <- 0
state["pp6_mrna"] <- 0
state["p1"] <- 1
state["p2"] <- 1
state["p3"] <- 1
state["p4"] <- 1
state["p5"] <- 1
state["p6"] <- 1

# Глобальные параметры 
# (Изменяются из тела функции dydt)
cod1 <- 0
cod2 <- 0
cod3 <- 0
cod4 <- 0
cod5 <- 0
cod6 <- 0
rs1 <- 1
rs2 <- 1
rs3 <- 1
rs4 <- 1
rs5 <- 1

# Предопределение части параметров
v2_Kd <- 1.901
v2_h <- 2.89
v3_Kd <- 0.5
v3_h <- 2.1
v4_Kd <- 11.1
v4_h <- 4.3
v5_Kd <- 1.45
v5_h <- 1.67
rbs2_strength <- 5.1
rbs3_strength <- 3.558
rbs4_strength <- 1.1
rbs5_strength <- 5.98
rbs6_strength <- 5.698
v1_Kd <- 3
pro3_strength <- 6.512
pro4_strength <- 8.962
pro5_strength <- 3.834
pro6_strength <- 3.4
degradation_rate <- 0.952
pro1_strength <- 4

# degradation_rate - один общий параметр
degradation_rate -> p1_degradation_rate
degradation_rate -> p2_degradation_rate
degradation_rate -> p3_degradation_rate
degradation_rate -> p4_degradation_rate
degradation_rate -> p5_degradation_rate
degradation_rate -> p6_degradation_rate
degradation_rate -> pp1_mrna_degradation_rate
degradation_rate -> pp2_mrna_degradation_rate
degradation_rate -> pp3_mrna_degradation_rate
degradation_rate -> pp4_mrna_degradation_rate
degradation_rate -> pp5_mrna_degradation_rate
degradation_rate -> pp6_mrna_degradation_rate
