# Politiek Sentiment Totaal NL
tmp <- df %>% 
  pivot_longer(cols = anxiety_tot:respect_tot,
               names_to = "emotion") %>% 
  mutate(
    emotion = case_when(
      emotion == "boredom_tot" ~ "Boredom",
      emotion == "aversion_tot" ~ "Aversion",
      emotion == "anxiety_tot" ~ "Anxiety",
      emotion == "distrust_tot" ~ "Distrust",
      emotion == "hope_tot" ~ "Hope",
      emotion == "interest_tot" ~ "Interest",
      emotion == "respect_tot" ~ "Respect",
      emotion == "enthusiasm_tot" ~ "Enthusiasm")) %>% 
  select(emotion, value) %>% 
  drop_na()

p1 <- ggplot(tmp, aes(x = value, y = emotion,
             color = emotion, fill = emotion)) +
  ggplot2::geom_boxplot(alpha = .3) +
  theme_ipsum() +
  labs(y = "", x = "Political Sentiment \n (0=low, 1= high)") +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "none",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
