library(tidyverse)
library(ggplot2)
library(dplyr)
library(scales) 

url <- "https://raw.githubusercontent.com/Stat184-Spring2026/Sec4_CP_Ben_Andrew_Mea/refs/heads/main/sleep_clean.csv"

sleep_clean <- read.csv(url)

set.seed(123)
sample_size = 100 #change this value if you want a different sample size
sleep_clean |>
  slice_sample(n = sample_size, replace = FALSE) |>
  ggplot(
    mapping = aes(x = naptime, y = cum_gpa)
  ) + labs(
    title = "GPA by Daytime Sleep",
    subtitle = sprintf("sample space of %a students", sample_size),
    x = "Time slept(mins)",
    y = "Student GPA"
  ) + geom_point(size = 2, color = "#2C6DB2") +
  geom_smooth(method = "lm")
theme_bw()