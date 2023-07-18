tmp <- df %>% 
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
         sm = 8 - sm,
         region = factor(region,
                         levels = c("North  of the country",
                                    "East  of the country",
                                    "South  of the countr",
                                    "West of the country",
                                    "Three big cities (Amsterdam, Rotterdam, The Hague)")),
         education = factor(education,
                            levels = c("Low", "Medium", "High")),
         urbanisation = factor(urbanisation,
                               levels = c("Not urbanised",
                                          "Lowly urbanised",
                                          "Medium urbanised",
                                          "Strongly urbanised",
                                          "Very strongly urbanised"))) %>% 
  select(`Profile` = smc,
         Gender = sex, Age = age, Education = education,
         Ethnicity= ethnicity, Region = region, 
         Urbanisation = urbanisation, `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Profile, Gender, Age, Education, 
          Ethnicity, Region, Urbanisation)

p1 <- ggbivariate(tmp, 
            outcome = "Profile",
            explanatory = c("Age","Gender","Education",
                            "Ethnicity", "Region", "Urbanisation"),
            rowbar_args = list(
              colour = "white",
              size = 2,
              label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

tmp <- df %>% 
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
         hours_sm = factor(hours_sm,
                           levels = c("Less than 10 minutes",
                                      "1 to 2 hours",
                                      "2 to 3 hours",
                                      "More than 3 hours")),
         hours_sm = replace_na(hours_sm, "1 to 2 hours"),
         sm = 8 - sm) %>% 
  select(`Profile` = smc,
          `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Profile)

p2 <- ggbivariate(tmp, 
                  outcome = "Profile",
                  explanatory = c("Ideology", "Political Trust", 
                                  "Political Knowledge", "Media Literacy",
                                  "Sociale Media Usage"),
                  rowbar_args = list(
                    colour = "white",
                    size = 2,
                    label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


p3 <- tmp %>% 
  group_by(Profile) %>% 
  count() %>% 
  ungroup() %>% 
  mutate(perc = n/dim(tmp)[1]) %>% 
  ggplot(aes(y = Profile, x = perc,
            fill = Profile)) +
  geom_col() +
  theme_ipsum() +
  labs(x = "Media Consumption", y = "") +
  #facet_wrap(vars(Profile), ncol = 2, scales = "free") +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  scale_x_continuous(labels = scales::percent_format(accuracy = 1)) +
  theme(legend.title = element_blank(),
        legend.position = "none")
