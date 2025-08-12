#Calculating TSS and kappa
#Script adapted from https://github.com/KarlssonCatharina/MaxEnt_TSS_calculations

#to be able to run this script you need to have told the Maxent model to produce background predictions. If you are running MaxEnt in R this means putting the argument (after "args") "writebackgroundpredictions=true" as true not false. 

#put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_1_F_lt_Set_1_E")

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("Antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("Antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.6486

TSS_calculations <- function (sample_clog, prediction_clog, n, th) {
  
  xx <- sum(sample_clog > th)
  yy <- sum(prediction_clog > th)
  xxx <- sum(sample_clog < th)
  yyy <- sum(prediction_clog < th)
  
  ncount <- sum(xx,yy,xxx,yyy)
  
  overallaccuracy <- (xx + yyy)/ncount 
  sensitivity <- xx / (xx + xxx)
  specificity <- yyy / (yy + yyy)
  tss <- sensitivity + specificity - 1
  
  #kappa calculations
  a <- xx + xxx
  b <- xx + yy
  c <- yy + yyy
  d <- xxx + yyy
  e <- a * b
  f <- c * d
  g <- e + f
  h <- g / (ncount * ncount)
  hup <- overallaccuracy - h
  hdown <- 1 - h
  
  kappa <- hup/hdown
  Po <- (xx + yyy) / ncount
  Pe <- ((b/ncount) * (a/ncount)) + ((d/ncount) * (c/ncount))
  Px1 <- Po - Pe
  Px2 <- 1 - Pe
  Px3 <- Px1/Px2
  
  tx1 <- xx + yyy
  tx2 <- 2 * a * c
  tx3 <- a - c
  tx4 <- xx - yyy
  tx5 <- ncount * (( 2 * a ) - tx4)
  tx6 <- ncount * tx1
  
  kappamax <- (tx6 - tx2 - (tx3 * tx4)) / ((tx5 - tx3) - (tx3 * tx4))
  
  cat(" Maxent results for model with\n",a,"test sample predictions\n",c ,"background predicitons\n\n TSS value:        ", tss,"\n Overall accuracy: ",overallaccuracy,"\n Sensitivity:      ",sensitivity,"\n Specificity:      ",specificity,"\n Kappa:            ",kappa,"\n Kappa max:        ",kappamax)
  
  TSS_value <- c(tss)
  Overall_accuracy <- c(overallaccuracy)
  Sensitivity <- c(sensitivity)
  Specificity <- c(specificity)
  Kappa <- c(kappa)
  Kappa_max <- c(kappamax)
  
  df <- data.frame(TSS_value, Overall_accuracy, Sensitivity, Specificity, Kappa, Kappa_max)
  df
}

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.9_F_lqp_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("Antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("Antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5731

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqt_Set_1_E")

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5757

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqt_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5757

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lq_Set_1_E")

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5757

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lq_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5757

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_1_F_lqp_Set_1_E")

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5778

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.1_F_q_Set_1_E")

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5246

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.2_F_q_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5277

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.3_F_q_Set_1_E")

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5308

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.4_F_q_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5338

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.5_F_q_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5368

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.6_F_q_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5397

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.7_F_q_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5426

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.8_F_q_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5454

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.9_F_q_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5482

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_1_F_q_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.551

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lq_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.6076

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lq_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5961

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqt_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5961

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqt_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5961

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqh_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.569

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqh_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.569

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqth_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.569

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)



###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_lqth_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.569

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_qt_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5761

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_qt_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5761

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_q_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5761

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_q_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5761

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqth_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5757

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqth_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5757

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqh_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5757

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqh_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5757

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_qpt_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.6194

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_qp_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.6194

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lq_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5915

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lq_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5915

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqt_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5915

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqt_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5915

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqh_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5915

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqh_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5915

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqth_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5915

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_4_F_lqth_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5915

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qh_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5972

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qth_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5972

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qt_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5972

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qh_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5972

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qth_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5972

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_q_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5972

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_q_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5972

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_3_F_qt_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5972

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqpt_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5953

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_2_F_lqp_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5953

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.9_F_lqt_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.559

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.9_F_lqt_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.559

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.9_F_lt_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.6451

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.4_F_lq_Set_5_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5608

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)


###put the working directory as the folder where the maxent results are 
setwd("C:/Users/Kat/Desktop/Antilocapra/kuenm_antilocapra/final_models/M_0.4_F_lq_Set_1_E") 

#read in the background predictions
list.files()

#read in the file 
backgroundpredictions <- read.csv("antilocapra_4_backgroundPredictions.csv")

#we need the last column so will set the number as x
x <- length(backgroundpredictions)

#extract the cloglog/logistic results
backgroundclog <- backgroundpredictions[,x]

#now read in the sample predictions for testing
samplepredictions <- read.csv("antilocapra_4_samplePredictions.csv")

#we need the last column again of logistic or cloglog predictions so set a second x
x2 <- length(samplepredictions)

#extract the cloglog/logistic results for sample
sampleclog <- samplepredictions[,x2]

#set n the number of pseudoabsences used for background predictions by MaxEnt
n <- 1000

#set threshold value (Maximum training sensitivity plus specificity Cloglog threshold)
th <- 0.5566

#run the function, the input values are the sampleclog values, then the background clog values, the sample number for the pseudo absences and then threshold value
result = TSS_calculations(sampleclog,backgroundclog,n,th)

