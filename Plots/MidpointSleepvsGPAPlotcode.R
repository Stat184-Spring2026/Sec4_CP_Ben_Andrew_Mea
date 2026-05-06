ggplot(sleep_clean, aes(x = midpoint_sleep, y = term_gpa)) +
  geom_point(alpha = 0.4, color = "#5A9E6F", size = 2) +
  geom_smooth(method = "lm", se = TRUE, color = "#C44E52", linewidth = 1) +
  labs(
    title    = "Midpoint Sleep vs Term GPA",
    subtitle = "Midpoint sleep = halfway point between bedtime and wake time (minutes after midnight)",
    x        = "Midpoint Sleep (minutes after midnight)",
    y        = "Term GPA",
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title    = element_text(face = "bold"),
    plot.subtitle = element_text(color = "gray40"),
    plot.caption  = element_text(color = "gray50")
  )
