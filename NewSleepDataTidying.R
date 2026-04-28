

library(tidyverse)

raw <- read_csv("C:/Users/andre/Downloads/cmu-sleep.csv")

sleep_clean2 <- raw %>%
  select(
    id          = subject_id,
    race        = demo_race,
    gender      = demo_gender,
    firstgen    = demo_firstgen,
    total_sleep = TotalSleepTime,
    cum_gpa,
    term_gpa,
    midpoint_sleep,
    naptime = daytime_sleep 
  )

sleep_clean2 <- sleep_clean2 %>%
  mutate(
    
    # Race: 0 = Underrepresented, 1 = Not Underrepresented
    race = factor(race,
                  levels = c(0, 1),
                  labels = c("Underrepresented", "Not Underrepresented")),
    
    # Gender: 0 = Male, 1 = Female
    gender = factor(gender,
                    levels = c(0, 1),
                    labels = c("Male", "Female")),
    
    # First-generation college student: 0 = Not First-Gen, 1 = First-Gen
    firstgen = factor(firstgen,
                      levels = c(0, 1),
                      labels = c("Not First-Gen", "First-Gen"))
  )

sleep_clean2 <- sleep_clean2 %>%
  filter(
    !is.na(total_sleep),
    !is.na(cum_gpa),
    !is.na(term_gpa),
    !is.na(gender),
    !is.na(firstgen),
    !is.na(race)
  )
  

