# MechaCar_Statistical_Analysis

The following analysis was performed using Rstudio and written in R. For details of the analysis please review the code [here.](/Challenge/MechaCarChallenge.R)

## Linear Regression to Prediect MPG
![regression_summary](/Challenge/Images/dev1_regression_sum.png)

**SUMMARY**
* The intercept, vehicle_length, and ground_clearnance were the variables that provided a non-random amount of variance. This is indicated by the three stars *** in the coefficients table above. The significance of this calculation is further explained by the "Signif. codes:" in the summary above.
* The slope of this linear model is not considered to be zero. This is because the p value is 5.35e-11 or 0.0000000000535, which is much smaller than the significance level of 0.05. This p value is calculated using a null hypothesis of a linear regression is equal to zero. With such a small p value, we can reject the null hypothesis with a high likelyhood of the slope not being equal to zero.
* This linear regression fits the sample data fairly well. The residuals are relatively balanced around the mean, indicating a little more likely to miss low but not much. The multiple r squared value is 0.7149, stating that with the current data set, we are 71.5% correct in matching the data witht he model. The adjusted r squared value is 0.6825 when taking into account all the input variables. This means this corefficient of determination has the model at roughly 68.3% match with the data. If the end use requries a better match, we may want to consider removing some variables that have low significance such as spoiler_angle, or AWD.  

## Summary Statistics on Suspension Coils
![total_summary](/Challenge/Images/total_summary_df.png)

![lot_summary](/Challenge/Images/lot_summary_df.png)

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

**SUMMARY**
* When looking at the dataset as a whole, the variance is under the 100 pounds per square inch variance limitation. When the data is seperated into three manufacturing lots, Lot3 has a much higher measured variance. This high variance number indicates that some of the suspension coils in Lot3 do not meet the necessary requirements and further investigation is needed.

## T-Tests on Suspension Coils
![ttest_all](/Challenge/Images/ttest_all.png)

![ttest_lot1](/Challenge/Images/ttest_lot1.png)

![ttest_lot2](/Challenge/Images/ttest_lot2.png)

![ttest_lot3](/Challenge/Images/ttest_lot3.png)

**SUMMARY**
* The first image above, represents the entire data sample t-test. The p-value is equal to 0.06, which means we cannont reject the null hypothesis for a 95 percent confidence interval. This indicates that the true mean may be equal to 1500, for the entire data set.
* For Lot1, we fail to reject the null hypothesis because the p value is equal to 1. In order for us to accept the null hypothesis with a 95 percent confidence interval, the p value must be less than 0.05. This indicates that the true mean may be equal to 1500, for Lot1 data set.
* For Lot2, we fail to reject the null hypothesis because the p value is equal to 0.6072. In order for us to accept the null hypothesis with a 95 percent confidence interval, the p value must be less than 0.05. This indicates that the true mean may be equal to 1500, for Lot1 data set.
* For Lot3, we can reject the null hypothesis with a 95 percent confidence interval. The p value is 0.04168, which is lower than 0.05. This indicates the true mean is leily not equal to 1500. This should trigger more investigation as to why Lot3 is an outlier compared to the other lots.

## Study Design: MechaCar vs Competition

Environmental impact has proven to be a significant consideration for vehicle consumers in recent years. There is a large customer base who prefer a vehicle to have a lower environmental impact. One key metric that marketers use to show long term environmental impact is highway miles per gallon. Higher fuel efficiency is a marketable and competitive advantage. A statistical study that could quantify how MechaCar performs against the competition could shape the brands image and drive sales. 

Metrics to be tested include the following:
* Fuel efficiency highway (MPG) 
* Fuel efficiency city (MPG)
* Vehicle type (SUV, sedan, etc.) 
* Engine type (Electric, gasoline, hybrid, etc.)
* Vehicle weight
* Safety rating

Hypothesis:
* Null Hypothesis (Ho): There is no fuel efficiency difference between MechaCar and its competitors.
* Alternate Hypothesis (Ha): There is a difference in fuel efficiency between MechaCar and its competitors.

Statistical Tests:
* ANOVA tests could be run to see if there are significant differences between the means of the variables listed above and the vehicle manufacturers. ANOVA tests work well to survey the data and see if the groups are differenet from one another. This would work well to show MachaCar against the field of competitors. 
* Multiple T-tests could be performed to show significant differences on certain variables against the competitive manufacturers. This type of analysis would work well to show a statistical difference between targeted variables and targeted competitor. For instance, competitor X has a reputation for city fuel efficiency. A visual showing a significant difference with MechaCar having a better city fuel efficiency could be desirable to single out competitor X. 
* Multivariate ANOVA test could be used to find differences with certain vehicle competitors and multiple metrics. Is MechaCar statistically similar in safety rating while having a better fuel efficiency? This test could answer these types of questions.

**SUMMARY**
Data for the above metrics would need to be collected for MechaCar models, and the models of each of the MechaCar competitors and grouped accordingly. The more data acquired, the more significant the results will be. If possible, data from independent automotive testers would be preferred. Once this data is compiled, summary statistics should be output to gain an understanding of the data. When the summary statistics are in hand, a more specific set of questions can be made. It is quite possible the question of "is there a difference between fuel efficiencies" changes to, "is there a difference of 3 mpg between the samples". The analysis should be shown to the marketing team so they can provide feedback and the analysis can be iterated to answer necessary questions. Hopefully at the end of the analysis a clear picture of where MechaCar outshines the competition can be made.


