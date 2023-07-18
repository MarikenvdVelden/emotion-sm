#Anger
tmp <- d1 %>% 
   mutate(sex = case_when(
    sex == 0 ~ "Male",
    sex == 1 ~ "Female"),
    age = 2018 - age,
    tmp = "1") %>% 
  select(Anger = anger,
         Gender = sex, Age = age, Education = education,
         Country = country, tmp) %>% 
  drop_na()

p1 <- ggbivariate(tmp, 
                  outcome = "Anger",
                  explanatory = c("Age","Gender","Education",
                                  "Country"),
                  rowbar_args = list(
                    color = "white",
                    size = 2,
                    label_format = scales::label_percent(accurary = 1)),
                  types = list(comboVertical = "autopoint"),
                  mapping = aes(color = tmp, fill = tmp, alpha = .5)) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols[1]) +
  scale_color_manual(values = fig_cols[1]) +
  theme(legend.title = element_blank(),
        legend.position = "none",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


#Anxiety
tmp <- d1 %>% 
  mutate(sex = case_when(
    sex == 0 ~ "Male",
    sex == 1 ~ "Female"),
    age = 2018 - age,
    tmp = "1") %>% 
  select(Anxiety = anxiety,
         Gender = sex, Age = age, Education = education,
         Country = country, tmp) %>% 
  drop_na()

p2 <- ggbivariate(tmp, 
                  outcome = "Anxiety",
                  explanatory = c("Age","Gender","Education",
                                  "Country"),
                  rowbar_args = list(
                    color = "white",
                    size = 2,
                    label_format = scales::label_percent(accurary = 1)),
                  types = list(comboVertical = "autopoint"),
                  mapping = aes(color = tmp, fill = tmp, alpha = .5)) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols[1]) +
  scale_color_manual(values = fig_cols[1]) +
  theme(legend.title = element_blank(),
        legend.position = "none",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


## Political Sentiment per country
# anger, disgust, fear, anxiety, sad, depressed, hope, proud, happy, 
# confident, enthusiasm, relieved

fig_cols2 <- c(fig_cols, "darkorchid4", "lightsteelblue2")

p3 <- d1 %>% 
  pivot_longer(cols = anger:relieved,
               names_to = "emotion") %>% 
  mutate(emotion = case_when(
    emotion == "anger" ~ "Anger",
    emotion == "disgust" ~ "Disgust",
    emotion == "fear" ~ "Fear",
    emotion == "anxiety" ~ "Anxiety",
    emotion == "sad" ~ "Sadness",
    emotion == "depressed" ~ "Depression",
    emotion == "hope" ~ "Hope",
    emotion == "proud" ~ "Pride",
    emotion == "happy" ~ "Happiness",
    emotion == "confident" ~ "Confidence",
    emotion == "enthusiasm" ~ "Enthusiasm",
    emotion == "relieved" ~ "Relief"),
    country = factor(country,
                    levels = c("the Netherlands",
                               "Sweden", "Spain",
                               "Romania", "Portugal",
                               "Poland", "Italy",
                               "Hungary", "Germany",
                               "France", "Denmark",
                               "Belgium-Wallonia", "Belgium-Flanders",
                               "Austria")),
    emotion = factor(emotion,
                     levels = c("Anger", "Anxiety", "Fear",
                                "Disgust", "Depression", "Sadness",
                                "Confidence","Enthusiasm", "Happiness", 
                                "Hope", "Pride", "Relief"))) %>% 
  select(emotion, value, country) %>% 
  drop_na() %>% 
  ggplot(aes(x = value, y = country,
             color = emotion, fill = emotion)) +
  geom_boxplot(alpha = .3) +
  theme_ipsum() +
  labs(y = "", x = "Political Sentiment \n (0=low, 10= high)") +
  facet_wrap(vars(emotion), ncol = 4, scales = "free") +
  scale_fill_manual(values = fig_cols2) +
  scale_color_manual(values = fig_cols2) +
  theme(legend.title = element_blank(),
        legend.position = "none",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

