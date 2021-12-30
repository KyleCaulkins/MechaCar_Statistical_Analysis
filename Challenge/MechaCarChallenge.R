#Deliverable 1
#load dyplr package
library(dplyr)
#Import csv as dataframe
mechaCar_mpg<-read.csv(file="MechaCar_mpg.csv",check.names=F,stringsAsFactors=F)
#Perform linear regression using lm() function
lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mechaCar_mpg)
#Use summary() function to determine p value and r squared value
summary(lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mechaCar_mpg))
#p value in summary is 5.35e-11 or 0.0000000000535
#adjusted r squared value is 0.6825

#Deliverable 2
#Import csv as dataframe
suspension_coil<-read.csv(file="Suspension_Coil.csv",check.names=F,stringsAsFactors=F)
#Create total_summary dataframe using summarize() function
total_summary<- suspension_coil %>% summarize(Mean=mean(PSI),Median=(PSI),Variance=var(PSI),SD=sd(PSI))
#Create lot_summary dataframe using group_by() and summarize() functions
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean =mean(PSI), Median = median(PSI), Variance= var(PSI), SD= sd(PSI))

#Deliverable 3
