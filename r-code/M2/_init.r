# Вектор состояния системы
state <- c()
state["pp1_mrna"] <- 0
state["pp2_mrna"] <- 0
state["pp3_mrna"] <- 0
state["pp4_mrna"] <- 0
state["pp5_mrna"] <- 0
state["pp6_mrna"] <- 0
state["pp7_mrna"] <- 0
state["p1"] <- 1
state["p2"] <- 1
state["p3"] <- 1
state["p4"] <- 1
state["p5"] <- 1
state["p6"] <- 1
state["p7"] <- 1

# Глобальные параметры 
# (Изменяются из тела функции dydt)
cod1 <- 1
cod2 <- 1
cod3 <- 1
cod4 <- 1
cod5 <- 1
cod6 <- 1
cod7 <- 1
rs1 <- 1
rs2 <- 1
rs3 <- 1
rs4 <- 1

# degradation_rate - один общий параметр
degradation_rate -> p1_degradation_rate
degradation_rate -> p2_degradation_rate
degradation_rate -> p3_degradation_rate
degradation_rate -> p4_degradation_rate
degradation_rate -> p5_degradation_rate
degradation_rate -> p6_degradation_rate
degradation_rate -> p7_degradation_rate
degradation_rate -> pp1_mrna_degradation_rate
degradation_rate -> pp2_mrna_degradation_rate
degradation_rate -> pp3_mrna_degradation_rate
degradation_rate -> pp4_mrna_degradation_rate
degradation_rate -> pp5_mrna_degradation_rate
degradation_rate -> pp6_mrna_degradation_rate
degradation_rate -> pp7_mrna_degradation_rate

