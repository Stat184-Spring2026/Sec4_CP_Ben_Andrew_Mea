library(tidyverse)
library(ggplot2)
library(dplyr)
library(scales) 

url <- "https://raw.githubusercontent.com/Stat184-Spring2026/Sec4_CP_Ben_Andrew_Mea/refs/heads/main/sleep_Clean2.csv"

sleep_clean2 <- read.csv(url)


# Term GPA means by Gender
sleep_clean2 %>%
  group_by(gender) %>%
  summarise(
    mean_gpa = mean(term_gpa),
    se = sd(term_gpa) / sqrt(n())
  ) %>%
  ggplot(aes(x = gender, y = mean_gpa, fill = gender)) +
  geom_col(alpha = 0.85) +
  geom_errorbar(aes(ymin = mean_gpa - se, ymax = mean_gpa + se),
                width = 0.2) +
  labs(
    title = "Mean Term GPA by Gender",
    x = "Gender",
    y = "Mean Term GPA"
  ) +
  theme_minimal() +
  theme(legend.position = "none")
