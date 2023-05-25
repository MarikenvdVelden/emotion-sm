dm <- df %>% 
  filter(wave!= "wave 5") %>% 
  mutate(smc = recode(smc, 
                      `2` = 1,
                      .default = 0),
         anxiety = as.factor(anxiety),
         anger = as.factor(anger)) %>% 
  select(anxiety, anger,
         smc, 
         conv_cs:cons_inter,
         age, sex, ethnicity,
         education, region, urbanisation, hours_sm, id, wave)

tmp <- df %>% 
  select(id, anger, anxiety) %>% 
  group_by(id) %>% 
  summarise(anger_tot = sum(anger, na.rm = T),
            anxiety_tot = sum(anxiety, na.rm = T),
            n_id = n()) %>% 
  mutate(anger_tot = round(anger_tot/n_id,2),
         anxiety_tot = round(anxiety_tot/n_id,2)) %>% 
  select(id, anxiety_tot, anger_tot)

dm <- left_join(dm, tmp, by = "id")

tmp <- df %>% 
  filter(wave == "wave 1") %>% 
  select(id, media_lit)

dm <- left_join(dm, tmp, by = "id")
dm <- dm %>% 
  mutate(media_lit = replace_na(media_lit, mean(media_lit, na.rm=T))) %>% 
  filter(wave == "wave 4")


## Angst
h2a <- broom::tidy(lm(conv_cs ~ anxiety_tot +
                 age + factor(sex) +
                 factor(ethnicity) +
                 factor(education) +
                 factor(region) +
                 factor(urbanisation) +
                 media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Angst",
         dv = "Conversie",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ anxiety_tot +
                 age + factor(sex) +
                 factor(ethnicity) +
                 factor(education) +
                 factor(region) +
                 factor(urbanisation) +
                 media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Angst",
         dv = "Conversie",
         id = "Intra-Blok")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Angst",
         dv = "Conversie",
         id = "Inter-Blok")

h2a <- h2a %>% 
  add_case(tmp)

dm <- df %>% 
  filter(wave == "wave 5") %>% 
  mutate(smc = recode(smc, 
                      `2` = 1,
                      .default = 0),
         anxiety = as.factor(anxiety),
         anger = as.factor(anger)) %>% 
  select(anxiety, anger,
         smc, 
         conv_cs:cons_inter,
         age, sex, ethnicity,
         education, region, urbanisation, hours_sm, id, wave)

tmp <- df %>% 
  select(id, anger, anxiety) %>% 
  group_by(id) %>% 
  summarise(anger_tot = sum(anger, na.rm = T),
            anxiety_tot = sum(anxiety, na.rm = T),
            n_id = n()) %>% 
  mutate(anger_tot = round(anger_tot/n_id,2),
         anxiety_tot = round(anxiety_tot/n_id,2)) %>% 
  select(id, anxiety_tot, anger_tot)

dm <- left_join(dm, tmp, by = "id")

tmp <- df %>% 
  filter(wave == "wave 1") %>% 
  select(id, media_lit)

dm <- left_join(dm, tmp, by = "id")
dm <- dm %>% 
  mutate(media_lit = replace_na(media_lit, mean(media_lit, na.rm=T)))

tmp <- broom::tidy(lm(cristal_cs ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Angst",
         dv = "Kristalisatie",
         id = "Choice-Set")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Angst",
         dv = "Kristalisatie",
         id = "Intra-Blok")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Angst",
         dv = "Kristalisatie", 
         id = "Inter-Blok")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Angst",
         dv = "Versteviging",
         id = "Choice-Set")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Angst",
         dv = "Versteviging",
         id = "Intra-Blok")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Angst",
         dv = "Versteviging", 
         id = "Inter-Blok")

h2a <- h2a %>% 
  add_case(tmp)

## Woede
dm <- df %>% 
  filter(wave!= "wave 5") %>% 
  mutate(smc = recode(smc, 
                      `2` = 1,
                      .default = 0),
         anxiety = as.factor(anxiety),
         anger = as.factor(anger)) %>% 
  select(anxiety, anger,
         smc, 
         conv_cs:cons_inter,
         age, sex, ethnicity,
         education, region, urbanisation, hours_sm, id, wave)

tmp <- df %>% 
  select(id, anger, anxiety) %>% 
  group_by(id) %>% 
  summarise(anger_tot = sum(anger, na.rm = T),
            anxiety_tot = sum(anxiety, na.rm = T),
            n_id = n()) %>% 
  mutate(anger_tot = round(anger_tot/n_id,2),
         anxiety_tot = round(anxiety_tot/n_id,2)) %>% 
  select(id, anxiety_tot, anger_tot)

dm <- left_join(dm, tmp, by = "id")

tmp <- df %>% 
  filter(wave == "wave 1") %>% 
  select(id, media_lit)

dm <- left_join(dm, tmp, by = "id")
dm <- dm %>% 
  mutate(media_lit = replace_na(media_lit, mean(media_lit, na.rm=T))) %>% 
  filter(wave == "wave 4")


h2b <- broom::tidy(lm(conv_cs ~ anger_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Woede",
         dv = "Conversie",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ anger_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Woede",
         dv = "Conversie",
         id = "Intra-Blok")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ anger_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Woede",
         dv = "Conversie",
         id = "Inter-Blok")

h2b <- h2b %>% 
  add_case(tmp)

dm <- df %>% 
  filter(wave == "wave 5") %>% 
  mutate(smc = recode(smc, 
                      `2` = 1,
                      .default = 0),
         anxiety = as.factor(anxiety),
         anger = as.factor(anger)) %>% 
  select(anxiety, anger,
         smc, 
         conv_cs:cons_inter,
         age, sex, ethnicity,
         education, region, urbanisation, hours_sm, id, wave)

tmp <- df %>% 
  select(id, anger, anxiety) %>% 
  group_by(id) %>% 
  summarise(anger_tot = sum(anger, na.rm = T),
            anxiety_tot = sum(anxiety, na.rm = T),
            n_id = n()) %>% 
  mutate(anger_tot = round(anger_tot/n_id,2),
         anxiety_tot = round(anxiety_tot/n_id,2)) %>% 
  select(id, anxiety_tot, anger_tot)

dm <- left_join(dm, tmp, by = "id")

tmp <- df %>% 
  filter(wave == "wave 1") %>% 
  select(id, media_lit)

dm <- left_join(dm, tmp, by = "id")
dm <- dm %>% 
  mutate(media_lit = replace_na(media_lit, mean(media_lit, na.rm=T)))


tmp <- broom::tidy(lm(cristal_cs ~ anger_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Woede",
         dv = "Kristalisatie",
         id = "Choice-Set")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ anger_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Woede",
         dv = "Kristalisatie",
         id = "Intra-Blok")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ anger_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Woede",
         dv = "Kristalisatie", 
         id = "Inter-Blok")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ anger_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Woede",
         dv = "Versteviging",
         id = "Choice-Set")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ anger_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Woede",
         dv = "Versteviging",
         id = "Intra-Blok")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ anger_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         emotie = "Woede",
         dv = "Versteviging", 
         id = "Inter-Blok")

h2b <- h2b %>% 
  add_case(tmp)

h2 <- h2a %>% 
  add_case(h2b) %>% 
  filter(term %in% c("anxiety_tot", "anger_tot")) %>% 
  mutate(term = recode(term,
                       `anger_tot` = "Woede",
                       `anxiety_tot` = "Angst"),
         upper = (estimate + (1.56*std.error)),
         lower = (estimate - (1.56*std.error))) %>% 
  ggplot(aes(x = estimate, y = term,
             xmin = lower, xmax = upper,
             color = term)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "Effect van Emotie op Volatiliteit",
       y = "Onfhankelijke Variabele: Emotie",
       caption = "Analyses zijn gecontroleerd voor demografische variabelen: \n geslacht, leeftijd, opleiding, ethniciteit, regio en mediageletterdheid") +
  scale_color_manual(values = fig_cols) +
  facet_grid(id~dv) +
  theme(legend.position = "none",
        legend.title = element_blank()) +
  geom_vline(xintercept = 0, linetype = "dashed", linewidth = .7, color = "lightgray")
