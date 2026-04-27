library(tidyverse)

raw <- read.csv("C:/Users/andre/Downloads/cmu-sleep.csv")

sleep_clean <- raw %>%
  select(
    id          = subject_id,
    naptime    = daytime_sleep,
    total_sleep = TotalSleepTime,
    midpoint_sleep,
    cum_gpa,
    term_gpa
  )




sleep_clean <- sleep_clean %>%
  filter(
    !is.na(total_sleep),
    !is.na(cum_gpa),
    !is.na(term_gpa),
    !is.na(midpoint_sleep),
    !is.na(naptime)
  )


glimpse(sleep_clean)
summary(sleep_clean)
