dm <- df %>% 
  select(id, smc) %>% 
  mutate(junkie = recode(smc, 
                         `1` = 1,
                         .default = 0),
         tmu = recode(smc, 
                      `3` = 1,
                      .default = 0),
         na = recode(smc,
                     `4` = 1,
                     .default = 0),
         smc = recode(smc, 
                      `2` = 1,
                      .default = 0)) %>% 
  group_by(id) %>% 
  summarise(smc_tot = sum(smc, na.rm = T),
            junkie_tot = sum(junkie, na.rm = T),
            tmu_tot = sum(tmu, na.rm = T),
            na_tot = sum(na, na.rm = T),
            n_id = n()) %>% 
  mutate(smc_tot = round(smc_tot/n_id,2),
         junkie_tot = round(junkie_tot/n_id,2),
         tmu_tot = round(tmu_tot/n_id,2),
         na_tot = round(na_tot/n_id,2)) %>% 
  select(id, smc_tot, junkie_tot, tmu_tot, na_tot)

tmp <- df %>% 
  filter(wave == "wave 5") %>% 
  select(anxiety_tot:respect_tot,
         age, sex, ethnicity,
         education, region, urbanisation, hours_sm, id, wave) %>% 
  mutate(anxiety_tot = replace_na(anxiety_tot, mean(anxiety_tot, na.rm=T)),
         aversion_tot = replace_na(aversion_tot, mean(aversion_tot, na.rm=T)),
         boredom_tot = replace_na(boredom_tot, mean(boredom_tot, na.rm=T)),
         distrust_tot = replace_na(distrust_tot, mean(distrust_tot, na.rm=T)),
         enthusiasm_tot = replace_na(enthusiasm_tot, mean(enthusiasm_tot, na.rm=T)),
         hope_tot = replace_na(hope_tot, mean(hope_tot, na.rm=T)),
         interest_tot = replace_na(interest_tot, mean(interest_tot, na.rm=T)),
         respect_tot = replace_na(respect_tot, mean(respect_tot, na.rm=T)),
         age = replace_na(age, mean(age, na.rm=T)),
         sex = replace_na(sex, "Male"),
         ethnicity = replace_na(ethnicity, "Dutch"),
         region = replace_na(region, "West of the country"),
         urbanisation = replace_na(urbanisation, "Strongly urbanised"), 
         education = replace_na(education, "Medium"),
         hours_sm = replace_na(hours_sm, "1 to 2 hours")) %>% 
  drop_na(id, wave) 

dm <- left_join(tmp, dm, by = "id")

tmp <- df %>% 
  filter(wave == "wave 1") %>% 
  select(id, media_lit)

dm <- left_join(dm, tmp, by = "id")
dm <- dm %>% 
  mutate(media_lit = replace_na(media_lit, mean(media_lit, na.rm=T)))

h1a <- broom::tidy(lm(anxiety_tot ~ smc_tot +
                        junkie_tot + tmu_tot + na_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - Hypotesis 1",
         dv = "Anxiety") 

h1b <- broom::tidy(lm(aversion_tot ~ smc_tot +
                        junkie_tot + tmu_tot + na_tot +
                                age + factor(sex) +
                                factor(ethnicity) +
                                factor(education) +
                                factor(region) +
                                factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - Hypotesis 1",
         dv = "Aversion") 

h1c <- broom::tidy(lm(boredom_tot ~ smc_tot +
                        junkie_tot + tmu_tot + na_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, data= dm)) %>% 
  mutate(hyp = "Dutch Study - H1b",
         dv = "Boredom") 

h1d <- broom::tidy(lm(distrust_tot ~ smc_tot +
                        junkie_tot + tmu_tot + na_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, data= dm)) %>% 
  mutate(hyp = "Dutch Study - H1b",
         dv = "Distrust") 

h1e <- broom::tidy(lm(enthusiasm_tot ~ smc_tot +
                        junkie_tot + tmu_tot + na_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, data= dm)) %>% 
  mutate(hyp = "Dutch Study - H1b",
         dv = "Enthusiasm") 

h1f <- broom::tidy(lm(hope_tot ~ smc_tot +
                        junkie_tot + tmu_tot + na_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, data= dm)) %>% 
  mutate(hyp = "Dutch Study - H1b",
         dv = "Hope") 

h1g <- broom::tidy(lm(interest_tot ~ smc_tot +
                        junkie_tot + tmu_tot + na_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, data= dm)) %>% 
  mutate(hyp = "Dutch Study - H1b",
         dv = "Interest") 

h1h <- broom::tidy(lm(respect_tot ~ smc_tot +
                        junkie_tot + tmu_tot + na_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, data= dm)) %>% 
  mutate(hyp = "Dutch Study - H1b",
         dv = "Respect") 

h1 <- h1a %>% 
  add_case(h1b) %>% 
  add_case(h1c) %>% 
  add_case(h1d) %>% 
  add_case(h1e) %>% 
  add_case(h1f) %>% 
  add_case(h1g) %>% 
  add_case(h1h) %>% 
  filter(term %in% c("smc_tot", "junkie_tot","tmu_tot", "na_tot")) %>% 
  mutate(term = recode(term,
                       `smc_tot` = "Social Media News Users",
                       `junkie_tot` = "Nieuws Junkies",
                       `na_tot` = "News Avoiders",
                       `tmu_tot` = "Traditional Media Users"),
         upper = (estimate + (1.96*std.error)),
         lower = (estimate - (1.96*std.error)),
         id = "Dutch Study - Hypothesis 1") %>% 
  ggplot(aes(x = estimate, y = term,
             xmin = lower, xmax = upper,
             color = term)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "Effect of Sociale Media News Use on Political Sentiment \n \n Analyses are controled for demographic variables: \n gender, age, education, ethnicity, region and media literacy",
      y = "") +
  scale_color_manual(values = fig_cols) +
  facet_wrap(vars(dv), ncol = 4, scales = "free") +
  theme(legend.position = "none",
        legend.title = element_blank()) +
  geom_vline(xintercept = 0, linetype = "dashed", linewidth = .7, color = "lightgray")

