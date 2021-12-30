# MechaCar_Statistical_Analysis

## Linear Regression to Prediect MPG
![regression_summary](/Challenge/Images/dev1_regression_sum.png)

Is the slope of the linear model considered to be zero? Why or why not?
Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

**SUMMARY**
* The intercept, vehicle_length, and ground_clearnance were the variables that provided a non-random amount of variance. This is indicated by the three stars *** in the coefficients table above. The significance of this calculation is further explained by the "Signif. codes:" in the summary above.
* The slope of this linear model is not considered to be zero. This is because the p value is 5.35e-11 or 0.0000000000535, which is much smaller than the significance level of 0.05. This p value is calculated using a null hypothesis of a linear regression is equal to zero. With such a small p value, we can reject the null hypothesis with a high likelyhood of the slope not being equal to zero.
* This linear regression fits the sample data fairly well. The residuals are relatively balanced around the mean, indicating a little more likely to miss low but not much. The multiple r squared value is 0.7149, stating that with the current data set, we are 71.5% correct in matching the data witht he model. The adjusted r squared value is 0.6825 when taking into account all the input variables. This means this corefficient of determination has the model at roughly 68.3% match with the data. If the end use requries a better match, we may want to consider removing some variables that have low significance such as spoiler_angle, or AWD.  

## Summary Statistics on Suspension Coils
add screenshots from total_summary and lot_summary dataframes
The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

## T-Tests on Suspension Coils
