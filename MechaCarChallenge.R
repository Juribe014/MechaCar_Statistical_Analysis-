## Deliverable 1
# 1. Use the library() function to load the dplyr package.
# ?library()
library(dplyr)

# 2. Import and read in the MechaCar_mpg.csv file and crate a dataframe.

mecha_mpg_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(mecha_mpg_df)


# 3. Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e., columns), and add the dataframe you created.
#?lm()
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg_df)  

#4 Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg_df))

## Deliverable 2

# 1.In your MechaCarChallenge.RScript, import and read in the Suspension_Coil.csv file as a table.
mecha_coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 

# 2. Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <- mecha_coil %>% summarize(Mean=mean(PSI),
                                          Median=median(PSI),
                                          Variance=var(PSI),
                                          SD=sd(PSI),
                                          .groups = 'keep')

# 3. Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
lot_summary <- mecha_coil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),
                                                                         Median=median(PSI),
                                                                         Variance=var(PSI),
                                                                         SD=sd(PSI),
                                                                         .groups = 'keep') 

## Deliverable 3

# 1. In your MechaCarChallenge.RScript, write an RScript using the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
t.test(mecha_coil$PSI,mu=1500)

# 2. Next, write three more RScripts in your MechaCarChallenge.RScript using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
# create the functions
lot1 <- subset(mecha_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(mecha_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(mecha_coil, Manufacturing_Lot=="Lot3")

# envoke the functions 
t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)

