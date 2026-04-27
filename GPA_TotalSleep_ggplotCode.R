library(tidyverse)
library(ggplot2)
library(dplyr)
library(scales) 

url <- "https://raw.githubusercontent.com/Stat184-Spring2026/Sec4_CP_Ben_Andrew_Mea/refs/heads/main/sleep_clean.csv"

sleep_clean <- read.csv(url)

set.seed(123)

sleep_clean |>
  slice_sample(n = 50, replace = FALSE) |>
  ggplot(
    mapping = aes(x = total_sleep, y = cum_gpa)
  ) + labs(
    title = "GPA by Amount of Sleep",
    subtitle = "sample space of 50 students",
    x = "Time slept(mins)",
    y = "Student GPA"
  ) + geom_point(size = 2, color = "#2C6DB2") +
  geom_smooth(method = "lm")
  theme_bw()
