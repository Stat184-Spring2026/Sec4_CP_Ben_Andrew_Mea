library(tidyverse)
library(ggplot2)
library(dplyr)
library(scales) 

url <- "https://raw.githubusercontent.com/Stat184-Spring2026/Sec4_CP_Ben_Andrew_Mea/refs/heads/main/sleep_Clean2.csv"

sleep_clean2 <- read.csv(url)

# Combined Demographics Table

sleep_clean2 <- sleep_clean2 %>%
  mutate(race_firstgen = interaction(race, firstgen, sep = " / "))


# Sleep Vs GPA by Demographic
sleep_clean2 %>%
  select(term_gpa, total_sleep, midpoint_sleep, naptime, race_firstgen) %>%
  pivot_longer(
    cols = c(total_sleep, midpoint_sleep, naptime),
    names_to = "sleep_variable",
    values_to = "sleep_value"
  ) %>%
  ggplot(aes(x = sleep_value, y = term_gpa, color = race_firstgen)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ sleep_variable, scales = "free_x") +
  labs(
    title = "Sleep Variables vs Term GPA by Race × First-Gen Status",
    x = "Sleep Measure (minutes)",
    y = "Term GPA",
    color = "Race × First-Gen"
  ) +
  theme_minimal() +
  theme(strip.text = element_text(size = 12, face = "bold"))

# Computing Correlations
sleep_clean2 %>%
  group_by(race_firstgen) %>%
  summarise(
    corr_total = cor(total_sleep, term_gpa, use = "complete.obs"),
    corr_midpoint = cor(midpoint_sleep, term_gpa, use = "complete.obs"),
    corr_naptime = cor(naptime, term_gpa, use = "complete.obs")
  )



# One Plot per Demographic group 

sleep_clean2 %>%
  select(term_gpa, total_sleep, midpoint_sleep, naptime, race_firstgen) %>%
  pivot_longer(
    cols = c(total_sleep, midpoint_sleep, naptime),
    names_to = "sleep_variable",
    values_to = "sleep_value"
  ) %>%
  ggplot(aes(x = sleep_value, y = term_gpa)) +
  geom_point(alpha = 0.5, color = "#4C72B0") +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  facet_grid(race_firstgen ~ sleep_variable, scales = "free_x") +
  labs(
    title = "Sleep Variables vs Term GPA by Race × First-Gen Status",
    x = "Sleep Measure (minutes)",
    y = "Term GPA"
  ) +
  theme_minimal() +
  theme(
    strip.text = element_text(size = 11, face = "bold")
  )


# Correlation Table

corr_table <- sleep_clean2 %>%
  group_by(race_firstgen) %>%
  summarise(
    corr_total_sleep = cor(total_sleep, term_gpa, use = "complete.obs"),
    corr_midpoint_sleep = cor(midpoint_sleep, term_gpa, use = "complete.obs"),
    corr_naptime = cor(naptime, term_gpa, use = "complete.obs")
  )

corr_table
View(corr_table)

























