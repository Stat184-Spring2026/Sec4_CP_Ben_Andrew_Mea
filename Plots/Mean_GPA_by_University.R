library(tidyverse)
library(ggplot2)
library(dplyr)
library(scales) 

url <- "https://raw.githubusercontent.com/Stat184-Spring2026/Sec4_CP_Ben_Andrew_Mea/refs/heads/main/sleep_Clean2.csv"

sleep_clean2 <- read.csv(url)


sleep_clean2 %>%
  group_by(university) %>%
  summarise(
    mean_gpa = mean(cum_gpa),
    se_gpa = sd(cum_gpa) / sqrt(n())
  ) %>%
  ggplot(aes(x = university, y = mean_gpa)) +
  geom_col(fill = "#4C72B0", alpha = 0.85) +
  geom_errorbar(
    aes(ymin = mean_gpa - se_gpa,
        ymax = mean_gpa + se_gpa),
    width = 0.2,
    linewidth = 0.8
  ) +
  labs(
    title = "Mean Cumulative GPA by University",
    x = "University",
    y = "Mean GPA"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 30, hjust = 1)
  )
