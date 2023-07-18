tmp <- d1 %>% 
  mutate(smc = recode(smc,
                      `1` = "News Junkies",
                      `2` = "Social Media News Users",
                      `3` = "Traditional Media Users",
                      `4` = "News Avoiders"),
         smc = factor(smc,
                      levels = c("News Junkies",
                                 "Social Media News Users",
                                 "Traditional Media Users",
                                 "News Avoiders")),
         region = factor(country),
         sex = case_when(
           sex == 0 ~ "Male",
           sex == 1 ~ "Female"),
         age = 2018 - age) %>% 
  select(`Profile` = smc,
         Gender = sex, Age = age, Education = education,
         Country = country) %>% 
  drop_na()

p1 <- ggbivariate(tmp, 
                  outcome = "Profile",
                  explanatory = c("Age","Gender","Education", "Country"),
                  rowbar_args = list(
                    colour = "white",
                    size = 2,
                    label_format = scales::percent_format(accuracy = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

countries <- tmp %>% 
  group_by(Country) %>% 
  count() %>% 
  rename(tot = n)

tmp <- tmp %>%
  group_by(Country, Profile) %>% 
  count() %>% 
  ungroup() 

tmp <- left_join(tmp, countries, by="Country")

p2 <- tmp %>% 
  mutate(perc = n/tot) %>% 
  ggplot(aes(y = Country, x = perc,
            fill = Profile)) +
  geom_col() +
  theme_ipsum() +
  labs(x = "", y = "") +
  facet_wrap(vars(Profile), ncol = 2, scales = "free") +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  scale_x_continuous(labels = scales::percent_format(accuracy = 1)) +
  theme(legend.title = element_blank(),
        legend.position = "none")
