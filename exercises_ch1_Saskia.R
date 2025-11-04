ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_point()`).
#> 
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point()

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point() +
  geom_smooth(method = "lm")
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm")
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm")

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  )
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
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
  geom_point()
#the relationship between bill_length_mm and bill_depth_mm is non linear

## 4. What happens if you make a scatterplot of species vs. bill_depth_mm? ----
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) +
  geom_point()
# What might be a better choice of geom?
      #geom_bar()

#test:
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) +
  geom_boxplot()+geom_jitter(width=.2, size=.5)

## 5. Why does the following give an error and how would you fix it?----

ggplot(data = penguins) + 
  geom_point()
    #x and y are not specified, you would need to choose two variables from the penguins to compare

## 6. What does the na.rm argument do in geom_point()? What is the default value of the argument? ----
    #na.rm controls whether missing values are silently removed or not. The default value of the argument is FALSE, and ggplot removes values automatically 
# Create a scatterplot where you successfully use this argument set to TRUE.
ggplot(
  data = penguins,
  mapping = aes(x = body_mass_g, y = flipper_length_mm)
) +
  geom_point(na.rm = TRUE)
#no warning message
#vs.
ggplot(
  data = penguins,
  mapping = aes(x = body_mass_g, y = flipper_length_mm)
) +
  geom_point(na.rm = F
  )
## 7. Add the following caption to the plot you made in the previous exercise: “Data come from the palmerpenguins package.”---- 
# Hint: Take a look at the documentation for labs().
ggplot(
  data = penguins,
  mapping = aes(x = body_mass_g, y = flipper_length_mm)
) +
  geom_point(na.rm = TRUE)+
labs(
  caption = "Data come from the palmerpenguins package",
)

## 8. Recreate the following visualization. What aesthetic should bill_depth_mm be mapped to? ----
# And should it be mapped at the global level or at the geom level?
    #bill_depth_mm should be mapped to geom_point, since the points are shaded accordingly, and to the local level
ggplot(
    data = penguins,
    aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_point(aes(color = bill_depth_mm)) + 
  geom_smooth()
## 9. Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions.----
  #would expect lines of best fit for each species because it is specified at the global level
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

## 10. Will these two graphs look different? Why/why not?----
  #they will be the same, they are just specified differently but provide the same result
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
#1.3
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()
#vs
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point()
ggplot(penguins, aes(x = species)) +
  geom_bar()
ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200)

# 1.5.5 Exercises ----

## 1.The mpg data frame that is bundled with the ggplot2 package contains 234 observations collected by the US Environmental Protection Agency on 38 car models. ---- 
# Which variables in mpg are categorical?
# Which variables are numerical? (Hint: Type ?mpg to read the documentation for the dataset.) 
# How can you see this information when you run mpg? 
view(mpg)
?mpg
    #manufacturer, model, trans, drv, fl, class are categorical
    #displ, year, cyl, cty, hwy
  
## 2 Make a scatterplot of hwy vs. displ using the mpg data frame. ----

ggplot(mpg, aes(x = hwy, y = displ)) + 
  geom_point()

# Next, map a third, numerical variable to color, then size, then both color and size, then shape. 
    #color
ggplot(mpg, aes(x = hwy, y = displ)) + 
  geom_point(aes(color=year))
    
    #size
ggplot(mpg, aes(x = hwy, y = fl)) + 
  geom_point(aes(size=cyl))

    #color and size
ggplot(mpg, aes(x = hwy, y = displ)) + 
  geom_point(aes(color=cty, size=cty))

    #color,size, shape
ggplot(mpg, aes(x = hwy, y = displ)) + 
  geom_point(aes(color=cty, size=cty, shape=cty))
# How do these aesthetics behave differently for categorical vs. numerical variables?
      #shape doesn't work for numerical data

## 3. In the scatterplot of hwy vs. displ, what happens if you map a third variable to linewidth?----
ggplot(mpg, aes(x = hwy, y = displ, linewidth = cty)) + 
  geom_point()
    #nothing, no line to alter width of
## 4. What happens if you map the same variable to multiple aesthetics?----
ggplot(mpg, aes(x = hwy, y = hwy, color=hwy)) + 
  geom_point()


## 5. Make a scatterplot of bill_depth_mm vs. bill_length_mm and color the points by species. ----
ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) + 
  geom_point(aes( color=species))+geom_smooth(method=lm)

ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) + 
  geom_point() +
  facet_wrap(~species)

# What does adding coloring by species reveal about the relationship between these two variables? What about faceting by species?
  #adelie has shorter bill lengths but greater bill depths, gentoo has greater bill lengths and lower bill depths.

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
    #label of "Species" vs "species"
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(
    color = "Species",
    shape = "Species"
  )
#> Warning: Removed 2 rows containing missing values (`geom_point()`).

## 7. Create the two following stacked bar plots. Which question can you answer with the first one? ----
# Which question can you answer with the second one?
    #1 shows species by island, can answer who lives where
    #2 answers which islands each species lives

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")

ggplot(penguins, aes(x = species, fill = island)) +
  geom_bar(position = "fill")

# 1.6.1 Exercises ----

## 1. Run the following lines of code. Which of the two plots is saved as mpg-plot.png? Why? ----
    #ggsave saves last plot made
ggplot(mpg, aes(x = class)) +
  geom_bar()
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave("mpg-plot.png")

## 2. What do you need to change in the code above to save the plot as a PDF instead of a PNG? ----
### How could you find out what types of image files would work in ggsave()?
    #change png to pdf
    ?ggsave()


