# MechaCar_Statistical_Analysis-

## Deliverable 1
```R
> # 2. Import and read in the MechaCar_mpg.csv file and crate a dataframe.

> mecha_mpg_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
> head(mecha_mpg_df)
```
```R
  vehicle_length vehicle_weight spoiler_angle ground_clearance AWD      mpg
1       14.69710       6407.946      48.78998         14.64098   1 49.04918
2       12.53421       5182.081      90.00000         14.36668   1 36.76606
3       20.00000       8337.981      78.63232         12.25371   0 80.00000
4       13.42849       9419.671      55.93903         12.98936   1 18.94149
5       15.44998       3772.667      26.12816         15.10396   1 63.82457
6       14.45357       7286.595      30.58568         13.10695   0 48.54268
```
```R
> # 3. Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e., columns), and add the dataframe you created.
> #?lm()
> lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg_df)  
```

```R
Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = mecha_mpg_df)

Coefficients:
     (Intercept)    vehicle_length    vehicle_weight     spoiler_angle  
      -1.040e+02         6.267e+00         1.245e-03         6.877e-02  
ground_clearance               AWD  
       3.546e+00        -3.411e+00  
```

```R
> #4 Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
> summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg_df))
```

```R
Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = mecha_mpg_df)

Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11
```

## Linear Regression to Predict MPG

1. Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?

   Based on the output for step four of deliverable 1, vehicle length and and ground cleareance provide a non-random amount of variance.

2. Is the slope of the linear model considered to be zero? Why or why not?

   Considering that the p-value is 5.35e-11, than I would determine that the slope is not 0. The relatively smalll p-value indicates that their is a correlation          between multiple parameters. 

3. Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

   Looking at the R-value (0.7149) one can determine that this model can be considered viable for predicting prototypes effectively.As for the effectivity, it would depend  on the owners or stakeholders on the amount of risk they are willing to take by using the current model. 

## Deliverable 2
 
 ```R
> # 1.In your MechaCarChallenge.RScript, import and read in the Suspension_Coil.csv file as a table.
> mecha_coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 
```

```R
> # 2. Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
```

```R
> total_summary <- mecha_coil %>% summarize(Mean=mean(PSI),
+                                           Median=median(PSI),
+                                           Variance=var(PSI),
+                                           SD=sd(PSI),
+                                           .groups = 'keep')
```

```R
> # 3. Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
> lot_summary <- mecha_coil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),
+                                                                          Median=median(PSI),
+                                                                          Variance=var(PSI),
+                                                                          SD=sd(PSI),
+                                                                          .groups = 'keep') 
```

## Summary Statistics on Suspension Coils
1. The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

   Lot 1 and Lot 2 meet the design specifications without any issues. With a variance of 0.98 PSI and 7.5 PSI. However when Lot 3 is analyzed, it was determined that is had a 170 PSI variance. This value greatly exceeds the specification. However, the means and medians are all with in the same range. This means that Lot 3 has outliesr that are skewing the data.  

## Deliverable 3

```R
> # 1. In your MechaCarChallenge.RScript, write an RScript using the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
> t.test(mecha_coil$PSI,mu=1500)
```

```R
	One Sample t-test

data:  mecha_coil$PSI
t = -1.8931, df = 149, p-value = 0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 
  1498.78 
```

```R
> # 2. Next, write three more RScripts in your MechaCarChallenge.RScript using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
> # create the functions
> lot1 <- subset(mecha_coil, Manufacturing_Lot=="Lot1")
> lot2 <- subset(mecha_coil, Manufacturing_Lot=="Lot2")
> lot3 <- subset(mecha_coil, Manufacturing_Lot=="Lot3")

> # envoke the functions 
> t.test(lot1$PSI,mu=1500)
```

```R
	One Sample t-test

data:  lot1$PSI
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 
```

```R
> t.test(lot2$PSI,mu=1500)
```

```R
	One Sample t-test

data:  lot2$PSI
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 
```

```R
> t.test(lot3$PSI,mu=1500)

	One Sample t-test

data:  lot3$PSI
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14 
```
## T-Tests on Suspension Coils

As shown by the findings above we can see that the overall data is not significant as the p-value equals 0.06028. However, when you break down the data into 3 lots, we can see that Lot 3 can be considered significant with a p-value of 0.04168. But by looking at other significant values such as the means of each lot, one can see that the difference is not significant. This could point to an outlier in Lot 3 that is skewing the data.  

![lot_summary](https://user-images.githubusercontent.com/104809098/188042968-e61904f2-7459-4b26-ac2a-c775c560c087.png)


## Study Design: MechaCar vs Competition


1. What metric or metrics are you going to test?

The first step of the analyzez would be to determine who are the competition. For this the type of cars that are manufactured need to be identified. Than the locations where MechaCar and the competition sellcars needs to be compared. For this one must look at historical sells with similar car types being compared. The date range would need to be identified. For example, if there was a change in car types 5 years ago, one should focus in that time frame. One also has to look at the demographics of the customers that are shared. One would need to look at multiple price ranges to determine if the customer demographics change or if the price ranges affect overall performance.

2. What is the null hypothesis or alternative hypothesis?

Null Hypothesis: There is no difference on the performancence between MechaCar and the Competition.

Alternate Hypothesis: When certain parameters are analyzed, one can see a difference in the performance of the cars between MechaCart and the Competition

3. What statistical test would you use to test the hypothesis? And why?

Based on the metrics that can be used, one will need to look at mutlple categories to get a reasonable conclusion. For this reason the chi-squared test would be the ideal test. 

4. What data is needed to run the statistical test?

The following list could be used to run the statistical test: Historical data for sales, Regional comparisons, Sales Demographics, Price Ranges.  













