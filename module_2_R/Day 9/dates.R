library(lubridate)
library(nycflights13)
library(tidyverse)

today()
now()

ymd("2020-01-01")

mdy("December 24th, 2019")

dmy("31-Oct-2018")

ymd(19830309)

ymd_hms("1982-09-03 8:00:00", tz = "EST")


# Lets grab a data time object from individual components

flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure = make_datetime(year, month, day, hour, minute))

# Lets convert all times in one pop

make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>% 
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>% 
  select(origin, dest, ends_with("delay"), ends_with("time"))

flights_dt

# Visaulization of the year
flights_dt %>% 
  ggplot(aes(dep_time)) + 
  geom_freqpoly(binwidth = 86400) # 86400 seconds = 1 day

# Visaulization of a day
flights_dt %>% 
  filter(dep_time < ymd(20130102)) %>% 
  ggplot(aes(dep_time)) + 
  geom_freqpoly(binwidth = 600) # 600 s = 10 minutes

# Separating components

datetime <- ymd_hms("2016-08-08 12:34:56")

year(datetime)
month(datetime, label = TRUE)
day(datetime)
yday(datetime)
wday(datetime)

flights_dt %>%
  mutate(wday = wday(dep_time, label = TRUE)) %>%
  filter(wday!="Sun" & wday!="Sat") %>%
  ggplot(aes(x = wday)) +
  geom_bar()

flights_dt %>% 
  mutate(dep_hour = update(dep_time, yday = 1)) %>% 
  ggplot(aes(dep_hour)) +
  geom_freqpoly(binwidth = 300)

# Operations with dates

ddays(1)
datetime<-ymd_hms("2020-01-01 00:00:00")

datetime+dyears(1)

datetime + days(1)
datetime + months(1)
datetime + years(1)

flights_dt %>% 
  filter(arr_time < dep_time) 

flights_dt <- flights_dt %>% 
  mutate(
    overnight = arr_time < dep_time,
    arr_time = arr_time + days(overnight * 1),
    sched_arr_time = sched_arr_time + days(overnight * 1)
  )
