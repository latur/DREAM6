dydt <- function(t, u, params){

    as1 <- ((1+((u["p1"]/v1_Kd)^v1_h))-1)/((1+((u["p1"]/v1_Kd)^v1_h)));
    as2 <- ((1+((u["p4"]/v4_Kd)^v4_h))-1)/((1+((u["p4"]/v4_Kd)^v4_h)));
    as3 <- ((1+((u["p5"]/v5_Kd)^v5_h))-1)/((1+((u["p5"]/v5_Kd)^v5_h)));
    as4 <- ((1+((u["p6"]/v6_Kd)^v6_h))-1)/((1+((u["p6"]/v6_Kd)^v6_h)));
    as5 <- ((1+((u["p7"]/v7_Kd)^v7_h))-1)/((1+((u["p7"]/v7_Kd)^v7_h)));
    as6 <- ((1+((u["p7"]/v10_Kd)^v10_h))-1)/((1+((u["p7"]/v10_Kd)^v10_h)));
    as7 <- ((1+((u["p6"]/v8_Kd)^v8_h))-1)/((1+((u["p6"]/v8_Kd)^v8_h)));
    as8 <- ((1+((u["p5"]/v9_Kd)^v9_h))-1)/((1+((u["p5"]/v9_Kd)^v9_h)));

    cod1 <<- pro1_strength;
    cod2 <<- pro2_strength * as1 * rs1;
    cod3 <<- pro3_strength * rs2 * rs3;
    cod4 <<- pro4_strength * rs7 * rs6;
    cod5 <<- pro5_strength * as2;
    cod6 <<- pro6_strength * (as3 + as4);
    cod7 <<- pro7_strength * (as7 + as8);
    cod8 <<- pro8_strength * as5 * rs4;
    cod9 <<- pro9_strength * as6 * rs5;

    rs1 <<- 1/(1+((u["p9"]/v13_Kd)^v13_h));
    rs2 <<- 1/(1+((u["p2"]/v2_Kd)^v2_h  ));
    rs3 <<- 1/(1+((u["p3"]/v3_Kd)^v3_h  ));
    rs4 <<- 1/(1+((u["p8"]/v11_Kd)^v11_h));
    rs5 <<- 1/(1+((u["p8"]/v12_Kd)^v12_h));
    rs6 <<- 1/(1+((u["p2"]/v14_Kd)^v14_h));
    rs7 <<- 1/(1+((u["p3"]/v15_Kd)^v15_h));

	ds = c();
    ds["pp1_mrna"] <- cod1 - pp1_mrna_degradation_rate * u["pp1_mrna"];
    ds["pp2_mrna"] <- cod2 - pp2_mrna_degradation_rate * u["pp2_mrna"];
    ds["pp3_mrna"] <- cod3 - pp3_mrna_degradation_rate * u["pp3_mrna"];
    ds["pp4_mrna"] <- cod4 - pp4_mrna_degradation_rate * u["pp4_mrna"];
    ds["pp5_mrna"] <- cod5 - pp5_mrna_degradation_rate * u["pp5_mrna"];
    ds["pp6_mrna"] <- cod6 - pp6_mrna_degradation_rate * u["pp6_mrna"];
    ds["pp7_mrna"] <- cod7 - pp7_mrna_degradation_rate * u["pp7_mrna"];
    ds["pp8_mrna"] <- cod8 - pp8_mrna_degradation_rate * u["pp8_mrna"];
    ds["pp9_mrna"] <- cod9 - pp9_mrna_degradation_rate * u["pp9_mrna"];
    ds["p1"] <- rbs1_strength * u["pp1_mrna"] - p1_degradation_rate * u["p1"];
    ds["p2"] <- rbs2_strength * u["pp2_mrna"] - p2_degradation_rate * u["p2"];
    ds["p3"] <- rbs3_strength * u["pp3_mrna"] - p3_degradation_rate * u["p3"];
    ds["p4"] <- rbs4_strength * u["pp4_mrna"] - p4_degradation_rate * u["p4"];
    ds["p5"] <- rbs5_strength * u["pp5_mrna"] - p5_degradation_rate * u["p5"];
    ds["p6"] <- rbs6_strength * u["pp6_mrna"] - p6_degradation_rate * u["p6"];
    ds["p7"] <- rbs7_strength * u["pp7_mrna"] - p7_degradation_rate * u["p7"];
    ds["p8"] <- rbs7_strength * u["pp8_mrna"] - p7_degradation_rate * u["p8"];
    ds["p9"] <- rbs7_strength * u["pp9_mrna"] - p7_degradation_rate * u["p9"];
	return(list(ds))
}
