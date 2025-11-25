# 3.2.5 Exercises
##1. In a single pipeline for each condition, find all flights that meet the condition:

### Had an arrival delay of two or more hours
### Flew to Houston (IAH or HOU)
### Were operated by United, American, or Delta
### Departed in summer (July, August, and September)
### Arrived more than two hours late but didn’t leave late
### Were delayed by at least an hour, but made up over 30 minutes in flight

## 2. Sort flights to find the flights with the longest departure delays. Find the flights that left earliest in the morning.

## 3. Sort flights to find the fastest flights. (Hint: Try including a math calculation inside of your function.)

## 4. Was there a flight on every day of 2013?

### 5. Which flights traveled the farthest distance? Which traveled the least distance?

### 6. Does it matter what order you used filter() and arrange() if you’re using both? Why/why not? Think about the results and how much work the functions would have to do.


# 3.3.5 Exercises

## 1. Compare dep_time, sched_dep_time, and dep_delay. How would you expect those three numbers to be related?
install.packages("nycflights13")
library(tidyverse)
library(nycflights13)
glimpse(nycflights13::flights)

flights|>
relocate(dep_time, sched_dep_time, dep_delay)
#dep_time = sched_dep_time +dep_delay
view(flights)


## 2. Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.
flights |> 
  select(dep_time, dep_delay, arr_time, arr_delay)

flights |> 
  select(starts_with("dep"), starts_with("arr"))


## 3. What happens if you specify the name of the same variable multiple times in a select() call?
flights|>
  select(dep_time, dep_time)
  #you still get the variable one time


## 4.  What does the any_of() function do? Why might it be helpful in conjunction with this vector?
any_of()?
  #have to use with a selecting function
 
variables <- c("year", "month", "day", "dep_delay", "arr_delay")
flights |> 
  select(any_of(variables))
#selects just from those 5 variables named in vector
## 5. Does the result of running the following code surprise you? How do the select helpers deal with upper and lower case by default? How can you change that default?

flights |> select(contains("TIME"))
#contains ignores upper and lower cases

## 6. Rename air_time to air_time_min to indicate units of measurement and move it to the beginning of the data frame.
flights |>
rename(air_time_min=air_time)|>
  relocate(air_time_min)

## 7. Why doesn’t the following work, and what does the error mean?

flights |> 
  select(tailnum) |> 
  arrange(arr_delay)
#because the only tailnum was selected, so now R will only work with tailnum

#> Error in `arrange()`:
#> ℹ In argument: `..1 = arr_delay`.
#> Caused by error:
#> ! object 'arr_delay' not found
