library(tidyverse)

raw <- read_csv("cmu-sleep.csv")

sleep_clean2 <- raw %>%
  select(
    id          = subject_id,
    race        = demo_race,
    gender      = demo_gender,
    firstgen    = demo_firstgen,
    total_sleep = TotalSleepTime,
    university  = study,
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
                      labels = c("Not First-Gen", "First-Gen")),
    # Study: 1 = Carnegie Mellon University sP2018, 2 = University of Washington SP2018, 3 = University of Washington SP2019, 4 = Notre Dame University SP2016, 5 = Carnegie Mellon University SP2017
    university = factor(university,
                        levels = c(1, 2, 3, 4, 5),
                        labels = c("Carnegie Mellon SP 2018", "University of Washington SP 2018", 
                                   "University of Washington SP 2019", "Notre Dame University SP 2016", 
                                   "Carnegie Mellon University SP 2017" ))
  )

sleep_clean2 <- sleep_clean2 %>%
  filter(
    !is.na(total_sleep),
    !is.na(cum_gpa),
    !is.na(term_gpa),
    !is.na(gender),
    !is.na(firstgen),
    !is.na(race),
    !is.na(university)
  )
View(sleep_clean2)  