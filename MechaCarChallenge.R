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