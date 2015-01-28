# Вектор состояния системы
state <- c()
state["pp1_mrna"] = 0
state["pp2_mrna"] = 0
state["pp3_mrna"] = 0
state["pp4_mrna"] = 0
state["pp5_mrna"] = 0
state["pp6_mrna"] = 0
state["pp7_mrna"] = 0
state["pp8_mrna"] = 0
state["pp9_mrna"] = 0
state["p1"] = 5
state["p2"] = 0
state["p3"] = 0
state["p4"] = 0
state["p5"] = 0
state["p6"] = 0
state["p7"] = 0
state["p8"] = 0
state["p9"] = 0

# Глобальные параметры 
# (Изменяются из тела функции dydt)
cod1 <- 1
cod2 <- 1
cod3 <- 1
cod4 <- 1
cod5 <- 1
cod6 <- 1
cod7 <- 1
cod8 <- 1
cod9 <- 1
rs1 <- 1
rs2 <- 1
rs3 <- 2
rs4 <- 1
rs5 <- 1
rs6 <- 2
rs7 <- 1

# degradation_rate - один общий параметр
# DREAM оговорено присвоить единице
1 -> p1_degradation_rate
1 -> p2_degradation_rate
1 -> p3_degradation_rate
1 -> p4_degradation_rate
1 -> p5_degradation_rate
1 -> p6_degradation_rate
1 -> p7_degradation_rate
1 -> p8_degradation_rate
1 -> p9_degradation_rate
1 -> pp1_mrna_degradation_rate
1 -> pp2_mrna_degradation_rate
1 -> pp3_mrna_degradation_rate
1 -> pp4_mrna_degradation_rate
1 -> pp5_mrna_degradation_rate
1 -> pp6_mrna_degradation_rate
1 -> pp7_mrna_degradation_rate
1 -> pp8_mrna_degradation_rate
1 -> pp9_mrna_degradation_rate

