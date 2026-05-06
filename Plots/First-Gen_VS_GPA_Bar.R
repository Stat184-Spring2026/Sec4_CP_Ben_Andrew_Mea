library(tidyverse)
library(ggplot2)
library(dplyr)
library(scales) 

url <- "https://raw.githubusercontent.com/Stat184-Spring2026/Sec4_CP_Ben_Andrew_Mea/refs/heads/main/sleep_Clean2.csv"

sleep_clean2 <- read.csv(url)

# First Gen and Non First Gen VS GPA

# Term GPA means
sleep_clean2 %>%
  group_by(firstgen) %>%
  summarise(
    mean_gpa = mean(term_gpa),
    se = sd(term_gpa) / sqrt(n())
  ) %>%
  ggplot(aes(x = firstgen, y = mean_gpa, fill = firstgen)) +
  geom_col(alpha = 0.85) +
  geom_errorbar(aes(ymin = mean_gpa - se, ymax = mean_gpa + se),
                width = 0.2) +
  labs(
    title = "Mean Term GPA by First-Generation Status",
    x = "First-Generation Status",
    y = "Mean Term GPA"
  ) +
  theme_minimal() +
  theme(legend.position = "none")
