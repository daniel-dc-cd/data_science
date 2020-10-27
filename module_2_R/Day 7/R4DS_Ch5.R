# Loading Libraries and data
library(tidyverse)
library(nycflights13)
fl<-flights


# Filter function

filter(flights, month == 1, day == 1)
jan1 <- filter(flights, month == 1, day == 1)

(nov_dec<-filter(flights, month == 11 | month == 12))

(no_delay<-filter(flights, dep_delay == 0 & arr_delay == 0))

(not_late <- filter(flights,arr_delay == 0))


# Arrange function

arrange(flights, year, month, day)

arrange(flights, desc(dep_delay))

#Select Function

select(flights, dep_delay)

M_flights <- flights[starts_with("M",vars = flights$dest),]

select(flights, dep_delay, everything())

#Mutate function

flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"),
                      distance,
                      air_time)

flights_sml_add <- mutate(flights_sml, 
                          gain = dep_delay - arr_delay,
                          speed = distance / air_time * 60,
                          hours = air_time / 60,
                          gain_per_hour = gain / hours)


transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours)

# Summarise function

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)
delay <- filter(delay, count > 20, dest != "HNL")

ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)


###### Using Pipes for Speed #######

delays <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance,na.rm = TRUE),
    delay = mean(arr_delay,na.rm = TRUE)
  ) %>%
  filter(count > 20, dest != "HNL")

########## Missing Values ##########

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay))

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

ggplot(data = delays, mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)

delays %>% 
  filter(n > 25) %>% 
  ggplot(mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)
