# Чтение параметров из указанного файла
# Значений параметров — 40. Уникальных — 29
# Разделитель — перенос строки
if(!file.exists(args[1])){ howto("Parameters file not found") }
p <- list()
tmp <- as.numeric(readLines(args[1]))
tmp[1]  -> p$p1_degradation_rate
tmp[1]  -> p$p2_degradation_rate
tmp[1]  -> p$p3_degradation_rate
tmp[1]  -> p$p4_degradation_rate
tmp[1]  -> p$p5_degradation_rate
tmp[1]  -> p$p6_degradation_rate
tmp[1]  -> p$pp1_mrna_degradation_rate
tmp[1]  -> p$pp2_mrna_degradation_rate
tmp[1]  -> p$pp3_mrna_degradation_rate
tmp[1] -> p$pp4_mrna_degradation_rate
tmp[1] -> p$pp5_mrna_degradation_rate
tmp[1] -> p$pp6_mrna_degradation_rate
tmp[2] -> p$pro1_strength
tmp[3] -> p$pro2_strength
tmp[4] -> p$pro3_strength
tmp[5] -> p$pro4_strength
tmp[6] -> p$pro5_strength
tmp[7] -> p$pro6_strength
tmp[8] -> p$rbs1_strength
tmp[9] -> p$rbs2_strength
tmp[10] -> p$rbs3_strength
tmp[11] -> p$rbs4_strength
tmp[12] -> p$rbs5_strength
tmp[13] -> p$rbs6_strength
tmp[14] -> p$v1_Kd
tmp[15] -> p$v1_h
tmp[16] -> p$v2_Kd
tmp[17] -> p$v2_h
tmp[18] -> p$v3_Kd
tmp[19] -> p$v3_h
tmp[20] -> p$v4_Kd
tmp[21] -> p$v4_h
tmp[22] -> p$v5_Kd
tmp[23] -> p$v5_h
tmp[24] -> p$v6_Kd
tmp[25] -> p$v6_h
tmp[26] -> p$v7_Kd
tmp[27] -> p$v7_h
tmp[28] -> p$v8_Kd
tmp[29] -> p$v8_h