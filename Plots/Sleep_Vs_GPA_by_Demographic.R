library(tidyverse)
library(ggplot2)
library(dplyr)
library(scales) 

url <- "https://raw.githubusercontent.com/Stat184-Spring2026/Sec4_CP_Ben_Andrew_Mea/refs/heads/main/sleep_Clean2.csv"

sleep_clean2 <- read.csv(url)

# Combined Demographics Table

sleep_clean2 <- sleep_clean2 %>%
  mutate(race_firstgen = interaction(race, firstgen, sep = " / "))


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
    facet_grid(race_firstgen ~ sleep_variable, scales = "free_x", switch = "y") +
     theme(
       strip.text.y.left = element_text(angle = 0, size = 12, face = "bold"),
       strip.placement = "outside"
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




#| label: tbl-sleep-correlations
#| tbl-cap: "Correlations between sleep variables (total sleep, midpoint sleep, and naptime) and term GPA, computed within each combined race × first-generation demographic group."

library(tidyverse)
install.packages("gt")
library(gt)

# Load data
url <- "https://raw.githubusercontent.com/Stat184-Spring2026/Sec4_CP_Ben_Andrew_Mea/refs/heads/main/sleep_Clean2.csv"
sleep_clean2 <- read.csv(url)

# Create combined demographic variable
sleep_clean2 <- sleep_clean2 %>%
  mutate(race_firstgen = interaction(race, firstgen, sep = " / "))

# Compute correlations
corr_table <- sleep_clean2 %>%
  group_by(race_firstgen) %>%
  summarise(
    corr_total_sleep = cor(total_sleep, term_gpa, use = "complete.obs"),
    corr_midpoint_sleep = cor(midpoint_sleep, term_gpa, use = "complete.obs"),
    corr_naptime = cor(naptime, term_gpa, use = "complete.obs")
  ) %>%
  mutate(across(starts_with("corr_"), round, 3))  # round to 3 decimals

# Display as a formatted table
corr_table %>%
  gt() %>%
  tab_header(
    title = "Correlation of Sleep Variables with Term GPA",
    subtitle = "Grouped by Race × First-Generation Status"
  ) %>%
  cols_label(
    race_firstgen = "Race × First-Gen Group",
    corr_total_sleep = "Total Sleep",
    corr_midpoint_sleep = "Midpoint Sleep",
    corr_naptime = "Naptime"
  )
```
























