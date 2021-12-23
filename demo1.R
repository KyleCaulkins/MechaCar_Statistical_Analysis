library(tidyverse)
demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)
library(jsonlite)
demo_table2 <- fromJSON(txt='demo.json')
filter_table <- demo_table2[demo_table2$price > 10000
                            
#add columns to original data frame                            
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) 
 

#create summary table
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), .groups = 'keep') 

#create summary table with multiple columns
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep')

#read csv for demo2
demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)

#Making long table from demotable3
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)

#alternative syntax
long_table <- demo_table3 %>% gather(key="Metric",value="Score",buying_price:popularity)

#Spread function
?spread()

#making the wide table
wide_table <- long_table %>% spread(key="Metric",value="Score")

#head of the mpg
head(mpg)

#ggplots for mpg bar plot
#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=class)) 
#plot a bar plot
plt + geom_bar() 
?geom_bar()

#Using dplyr function to summarize and ggplot2 to visualize
#create summary table
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') 
#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count))
#plot a bar plot
plt + geom_col()

#Formatting with xlab() and ylab()  
#plot bar plot with labels
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") 
#plot a boxplot with labels
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + 
theme(axis.text.x=element_text(angle=45,hjust=1)) #rotate the x-axis label 45 degrees

#making a line chart
#create summary table
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') 
#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) 
plt + geom_line()

#adjusting line chart to display discrete data rather than misrepresent as continuous
#add line plot with labels
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) 

#scatter plot time
#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty))
#add scatter plot with labels
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)")

#changing some aesthetics
#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class))
#add scatter plot with labels
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class")

#more asethetics
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv))
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive")

#making a box plot
#import dataset into ggplot2
plt <- ggplot(mpg,aes(y=hwy))
#add boxplot
plt + geom_boxplot()

#boxplot for vehicle mpg
#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy))
#add boxplot and rotate x-axis labels 45 degree
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))


#HEAT MAPS!!!!!!!!!!!!!!!
#create summary table
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))
#create heatmap with labels
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)")


#Get fancy with that heat map!
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy))
#add heatmap with labels
#rotate x-axis labels 90 degrees
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + 
theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5)) 

#Using layering technique using geom_point()
#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy))
#add boxplot
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) + geom_point()

#Mapping argument functions
#create summary table
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep')
#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine))
#add scatter plot
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size")

#Making layered plots using the geom functions
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine))
#add scatter plot with labels
#overlay with error bars
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine))


#for example we will convert the mpg to long data
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy))
head(mpg_long)

#now to visualize the long data
#import dataset into ggplot2
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type))
#add boxplot with labels rotated 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))
?facet_wrap()

#long format data faceting
#import dataset into ggplot
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)
#create multiple boxplots, one for each MPG type
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer")


#Testing for data distribution
#visualize distribution using density plot
ggplot(mtcars,aes(x=wt)) + geom_density()

#Sharpiro test quantitative test for narmality
?shapiro.test()
shapiro.test(mtcars$wt)

#Looking at sampling
?sample_n()

#looking at sampling from a data set
#import used car dataset
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F)
#import dataset into ggplot2
plt <- ggplot(population_table,aes(x=log10(Miles_Driven)))
#visualize distribution using density plot
plt + geom_density()
#randomly sample 50 data points
sample_table <- population_table %>% sample_n(50)
#import dataset into ggplot2
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven)))
#visualize distribution using density plot
plt + geom_density()

#Looking at t tests
?t.test()

#compare sample versus population means, one sided t test
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven)))

#two sided t test
#generate 50 randomly sampled data points
sample_table <- population_table %>% sample_n(50)
#generate another 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50)
#the t test here, compare means of two samples
t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven))

#paired t test
#import dataset
mpg_data <- read.csv('mpg_modified.csv')
#select only data points where the year is 1999
mpg_1999 <- mpg_data %>% filter(year==1999)
#select only data points where the year is 2008
mpg_2008 <- mpg_data %>% filter(year==2008)
#compare the mean difference between two samples
t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T)

#ANOVA TESTS
?aov()
#start by cleaning the data
#filter columns from mtcars dataset
mtcars_filt <- mtcars[,c("hp","cyl")]
#convert numeric column to factor
mtcars_filt$cyl <- factor(mtcars_filt$cyl)
#compare means across multiple levels
aov(hp ~ cyl,data=mtcars_filt)
#use summary to see the p values, which is Pr(>F) column
summary(aov(hp ~ cyl,data=mtcars_filt))

#Pearson correlation coefficient relationship
?cor()
#for example let's see if hp is correlated with qsec
#import dataset into ggplot2
plt <- ggplot(mtcars,aes(x=hp,y=qsec))
#create scatter plot
plt + geom_point()
#calculate correlation coefficient, pretty strong relationship
cor(mtcars$hp,mtcars$qsec)

#another correlation coefficient example
#read in dataset
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F)
head(used_cars)

#import dataset into ggplot2
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price))
#create a scatter plot
plt + geom_point()
#calculate correlation coefficient, negligible correlation
cor(used_cars$Miles_Driven,used_cars$Selling_Price)

#convert data frame into numeric matrix
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")])
cor(used_matrix)

#LINEAR REGRESSION
?lm()
#For example lets make a linear model to test whether or not qsec can be predicted using hp
#create linear model
lm(qsec ~ hp,mtcars)
#get the p value and r squared value by summarizing the linear model
summary(lm(qsec~hp,mtcars))
#now visualize
#create linear model
model <- lm(qsec ~ hp,mtcars)
#determine y-axis values from linear model
yvals <- model$coefficients['hp']*mtcars$hp + model$coefficients['(Intercept)']
#import dataset into ggplot2
plt <- ggplot(mtcars,aes(x=hp,y=qsec))
#plot scatter and linear model
plt + geom_point() + geom_line(aes(y=yvals), color = "red")

# MULTIPLE LINEAR REGRESSION
#using multiple linear regression to predict quarter mile time
#we will use multiple variables of interest to make our regression more accurate, mpg, disp, drat, wt, hp
#generate multiple linear regression model
lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)
#generate summary statistics
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars))
#Pr(>|t|) column tells us which variables are likely to contribute hp does contribute a lot, mpg does not contribute as much



# CHI S?chisq.test
?chisq.test()
#generate contingency table
table(mpg$class,mpg$year)
#generate contingency table another way...
tbl <- table(mpg$class,mpg$year)
#compare categorical distributions
chisq.test(tbl)
