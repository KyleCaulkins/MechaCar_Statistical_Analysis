# MechaCar_Statistical_Analysis

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

**SUMMARY*
* When looking at the dataset as a whole, the variance is under the 100 pounds per square inch variance limitation. When the data is seperated into three manufacturing lots, Lot3 has a much higher measured variance. This high variance number indicates that some of the suspension coils in Lot3 do not meet the necessary requirements and further investigation is needed.

## T-Tests on Suspension Coils
