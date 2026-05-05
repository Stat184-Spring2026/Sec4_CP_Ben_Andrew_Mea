library(tidyverse)

raw <- read.csv("https://raw.githubusercontent.com/Stat184-Spring2026/Sec4_CP_Ben_Andrew_Mea/refs/heads/main/cmu-sleep.csv")

sleep_clean <- raw %>%
  select(
    id          = subject_id,
    naptime    = daytime_sleep,
    total_sleep = TotalSleepTime,
    midpoint_sleep,
    bedtime_mssd,
    cum_gpa,
    term_gpa
  )




sleep_clean <- sleep_clean %>%
  filter(
    !is.na(total_sleep),
    !is.na(cum_gpa),
    !is.na(term_gpa),
    !is.na(midpoint_sleep),
    !is.na(bedtime_mssd),
    !is.na(naptime)
  )


glimpse(sleep_clean)
summary(sleep_clean)


