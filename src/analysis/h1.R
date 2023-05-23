dm <- df %>% 
  select(anxiety, smc, age, sex, ethnicity,
         education, region, urbanisation, media_lit, hours_sm,
         wave, id) %>% 
  mutate(anxiety = replace_na(anxiety, 0),
         smc = replace_na(smc, 1),
         age = replace_na(age, mean(age, na.rm=T)),
         sex = replace_na(sex, "Male"),
         ethnicity = replace_na(ethnicity, "Dutch"),
         region = replace_na(region, "West of the country"),
         urbanisation = replace_na(urbanisation, "Strongly urbanised"), 
         education = replace_na(education, "Medium"),
         media_lit = replace_na(media_lit, mean(media_lit, na.rm=T)),
         hours_sm = replace_na(hours_sm, "1 to 2 hours")) %>% 
  drop_na(id, wave)

h1a <- broom.mixed::tidy(lmer(anxiety ~ factor(smc) +
                                age + factor(sex) +
                                factor(ethnicity) +
                                factor(education) +
                                factor(region) +
                                factor(urbanisation) +
                                media_lit +
                                (1 | wave), data= df)) %>% 
  mutate(hyp = "H1a",
         type = "Alle Waves",
         dv = "Angst") 

