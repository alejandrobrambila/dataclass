# 1.2.5 Exercises ----
## 1. How many rows are in penguins? How many columns? ----

library(tidyverse)
library(palmerpenguins)
str(penguins)
#344 rows and 8 columns


## 2.  What does the bill_depth_mm variable in the penguins data frame describe? Read the help for ?penguins to find out.----
?penguins
# a number denoting bill depth in millimeters

## 3. Make a scatterplot of bill_depth_mm vs. bill_length_mm. ----
# That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm on the x-axis. 
# Describe the relationship between these two variables.

## 4. What happens if you make a scatterplot of species vs. bill_depth_mm? ----
# What might be a better choice of geom?

## 5. Why does the following give an error and how would you fix it?----

ggplot(data = penguins) + 
  geom_point()

## 6. What does the na.rm argument do in geom_point()? What is the default value of the argument? ----
# Create a scatterplot where you successfully use this argument set to TRUE.

## 7. Add the following caption to the plot you made in the previous exercise: “Data come from the palmerpenguins package.”---- 
# Hint: Take a look at the documentation for labs().

## 8. Recreate the following visualization. What aesthetic should bill_depth_mm be mapped to? ----
# And should it be mapped at the global level or at the geom level?

## 9. Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions.----

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

## 10. Will these two graphs look different? Why/why not?----

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )

# 1.5.5 Exercises ----

## 1.The mpg data frame that is bundled with the ggplot2 package contains 234 observations collected by the US Environmental Protection Agency on 38 car models. ---- 
# Which variables in mpg are categorical?
# Which variables are numerical? (Hint: Type ?mpg to read the documentation for the dataset.) 
# How can you see this information when you run mpg? 
  
## 2 Make a scatterplot of hwy vs. displ using the mpg data frame. ----
# Next, map a third, numerical variable to color, then size, then both color and size, then shape. 
# How do these aesthetics behave differently for categorical vs. numerical variables?
  
## 3. In the scatterplot of hwy vs. displ, what happens if you map a third variable to linewidth?----
  
## 4. What happens if you map the same variable to multiple aesthetics?----
  
## 5. Make a scatterplot of bill_depth_mm vs. bill_length_mm and color the points by species. ----
# What does adding coloring by species reveal about the relationship between these two variables? What about faceting by species?
  
## 6. Why does the following yield two separate legends? How would you fix it to combine the two legends?----
  
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(color = "Species")

## 7. Create the two following stacked bar plots. Which question can you answer with the first one? ----
# Which question can you answer with the second one?

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")

ggplot(penguins, aes(x = species, fill = island)) +
  geom_bar(position = "fill")

# 1.6.1 Exercises ----

## 1. Run the following lines of code. Which of the two plots is saved as mpg-plot.png? Why? ----

ggplot(mpg, aes(x = class)) +
  geom_bar()
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave("mpg-plot.png")

## 2. What do you need to change in the code above to save the plot as a PDF instead of a PNG? ----
### How could you find out what types of image files would work in ggsave()?



