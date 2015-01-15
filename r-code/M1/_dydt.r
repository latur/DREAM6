dydt <- function(t, u, params){
    as1 <- ((1+((u["p1"]/v2_Kd)^v2_h))-1)/(1+((u["p1"]/v2_Kd)^v2_h));
    as2 <- ((1+((u["p1"]/v1_Kd)^v1_h))-1)/(1+((u["p1"]/v1_Kd)^v1_h));
    as3 <- ((1+((u["p1"]/v3_Kd)^v3_h))-1)/(1+((u["p1"]/v3_Kd)^v3_h));

    cod1 <<- pro1_strength;
    cod2 <<- pro2_strength * as1 * rs1;
    cod3 <<- pro3_strength * as3 * rs4;
    cod4 <<- pro4_strength * as2 * rs2;
    cod5 <<- pro5_strength * rs3;
    cod6 <<- pro6_strength * rs5;

    rs1 <<- 1/(1+((u["p6"]/v5_Kd)^v5_h));
    rs2 <<- 1/(1+((u["p5"]/v8_Kd)^v8_h));
    rs3 <<- 1/(1+((u["p4"]/v6_Kd)^v6_h));
    rs4 <<- 1/(1+((u["p2"]/v4_Kd)^v4_h));
    rs5 <<- 1/(1+((u["p4"]/v7_Kd)^v7_h));

	ds = c();
	ds["pp1_mrna"] <- cod1 - pp1_mrna_degradation_rate * u["pp1_mrna"];
	ds["pp2_mrna"] <- cod2 - pp2_mrna_degradation_rate * u["pp2_mrna"];
	ds["pp3_mrna"] <- cod3 - pp3_mrna_degradation_rate * u["pp3_mrna"];
	ds["pp4_mrna"] <- cod4 - pp4_mrna_degradation_rate * u["pp4_mrna"];
	ds["pp5_mrna"] <- cod5 - pp5_mrna_degradation_rate * u["pp5_mrna"];
	ds["pp6_mrna"] <- cod6 - pp6_mrna_degradation_rate * u["pp6_mrna"];
	ds["p1"] <- rbs1_strength * u["pp1_mrna"] - p1_degradation_rate * u["p1"];
	ds["p2"] <- rbs2_strength * u["pp2_mrna"] - p2_degradation_rate * u["p2"];
	ds["p3"] <- rbs3_strength * u["pp3_mrna"] - p3_degradation_rate * u["p3"];
	ds["p4"] <- rbs4_strength * u["pp4_mrna"] - p4_degradation_rate * u["p4"];
	ds["p5"] <- rbs5_strength * u["pp5_mrna"] - p5_degradation_rate * u["p5"];
	ds["p6"] <- rbs6_strength * u["pp6_mrna"] - p6_degradation_rate * u["p6"];

	return(list(ds))
}
