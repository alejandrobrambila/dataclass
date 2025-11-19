# 3.3.5 Exercises
## 1. Compare dep_time, sched_dep_time, and dep_delay. How would you expect those three numbers to be related?
  
## 2. Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.


## 3. What happens if you specify the name of the same variable multiple times in a select() call?
  

##4.  What does the any_of() function do? Why might it be helpful in conjunction with this vector?
  
  variables <- c("year", "month", "day", "dep_delay", "arr_delay")

  
## 5. Does the result of running the following code surprise you? How do the select helpers deal with upper and lower case by default? How can you change that default?
  
  flights |> select(contains("TIME"))

  
## 6. Rename air_time to air_time_min to indicate units of measurement and move it to the beginning of the data frame.

  
##7. Why doesn’t the following work, and what does the error mean?
  
  flights |> 
  select(tailnum) |> 
  arrange(arr_delay)
  
#> Error in `arrange()`:
#> ℹ In argument: `..1 = arr_delay`.
#> Caused by error:
#> ! object 'arr_delay' not found

