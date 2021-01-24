library(dplyr)

MechaCar_mpg <- read.csv("MechaCar_mpg.csv")
head(MechaCar_mpg)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg) #generate multiple linear regression model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg))

summary(lm(mpg ~ vehicle_length + vehicle_weight + ground_clearance, data=MechaCar_mpg)) #curious - do these factors capture most of the impact?

SusCoil <- read.csv("Suspension_Coil.csv")
head(SusCoil)
library(tidyverse)
SummaryCoil <- SusCoil %>% group_by(Manufacturing_Lot) %>% summarise(Mean_PSI=mean(PSI),.groups='keep')

Aggegate_Summary <- SusCoil %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance=var(PSI),SD=sd(PSI))
Group_Summary <- SusCoil %>% group_by(Manufacturing_Lot) %>% summarise(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups='keep')
Aggegate_Summary
Group_Summary



t.test(SusCoil$PSI,mu=1500)
t.test(subset(SusCoil,Manufacturing_Lot=="Lot1")$PSI,mu=1500)
t.test(subset(SusCoil,Manufacturing_Lot=="Lot2")$PSI,mu=1500)
t.test(subset(SusCoil,Manufacturing_Lot=="Lot3")$PSI,mu=1500)
