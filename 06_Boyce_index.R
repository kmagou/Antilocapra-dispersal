### Calculating continuous boyce index

library(ecospat)  #ecospat v.4.1.2
library(terra)    #terra v.1.8.54

setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_1_F_lt_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra")
points <- read.csv("pts_train.csv") #use training points
presence_coords <- points[c("LONG", "LAT")]


ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
               rm.duplicate = TRUE, method = 'spearman')



setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.9_F_lqp_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqt_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqt_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')



setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lq_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lq_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_1_F_lqp_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.1_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.2_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.3_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.4_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.5_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.6_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.7_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.8_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.9_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_1_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lq_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lq_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqt_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqt_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqh_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqh_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqth_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqth_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_qt_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_qt_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_q_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqth_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqth_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqh_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqh_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_qpt_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_qp_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lq_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lq_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqt_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqt_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqh_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqh_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqth_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqth_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qh_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qth_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qt_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qh_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qth_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_q_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_q_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qt_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqpt_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqp_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.9_F_lqt_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.9_F_lqt_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.9_F_lt_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.4_F_lq_Set_5_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')


setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.4_F_lq_Set_1_E") 

fit = rast("antilocapra_median.asc") #use initial calibration area

ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
              rm.duplicate = TRUE, method = 'spearman')
