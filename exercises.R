### 1.2.5 Exercises
## 1. How many rows are in penguins? How many columns?
i
library(tidyverse)
library(palmerpenguins)
str(penguins)
#344 rows and 8 columns


## 2.  What does the bill_depth_mm variable in the penguins data frame describe? Read the help for ?penguins to find out.
?penguins
# a number denoting bill depth in millimeters

## 3. Make a scatterplot of bill_depth_mm vs. bill_length_mm. 
# That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm on the x-axis. 
# Describe the relationship between these two variables.

