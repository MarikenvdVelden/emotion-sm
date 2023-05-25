dm <- df %>% 
  filter(wave!= "wave 5") %>% 
  mutate(smc = recode(smc, 
                      `2` = 1,
                      .default = 0),
         smc = factor(smc),
         anxiety = as.factor(anxiety),
         anger = as.factor(anger)) %>% 
  select(anxiety, anger,
         smc, 
         conv_cs:cons_inter,
         age, sex, ethnicity,
         education, region, urbanisation, hours_sm, id, wave)

tmp <- df %>% 
  select(id, anger, anxiety, smc) %>% 
  group_by(id) %>% 
  summarise(anger_tot = sum(anger, na.rm = T),
            anxiety_tot = sum(anxiety, na.rm = T),
            smc_tot = sum(smc, na.rm = T),
            n_id = n()) %>% 
  mutate(anger_tot = round(anger_tot/n_id,2),
         anxiety_tot = round(anxiety_tot/n_id,2),
         smc_tot = round(smc_tot/n_id,2)) %>% 
  select(id, anxiety_tot, anger_tot, smc_tot)

dm <- left_join(dm, tmp, by = "id")

tmp <- df %>% 
  filter(wave == "wave 1") %>% 
  select(id, media_lit)

dm <- left_join(dm, tmp, by = "id")
dm <- dm %>% 
  mutate(media_lit = replace_na(media_lit, mean(media_lit, na.rm=T))) %>% 
  filter(wave == "wave 4")

## Angst
h3a <- lm(conv_cs ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)


h3a <- lm(conv_intra ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3a <- lm(conv_inter ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3a_1 <- interact_plot(model = h3a, pred = anxiety_tot, 
              modx = smc_tot, interval = F,
              data = dm, colors = fig_cols) +
  labs(y = "Voorspelde waarschijnlijkheid voor conversie inter-blok",
       x = "Mate van angst \n (0 = niet angstig, 1 = zeer angstig") +
  theme_ipsum() +
  theme(legend.position = "none") +
geom_curve(
  aes(x = .5, y = .036, xend = .8, yend = .0387),
  arrow = arrow(length = unit(0.03, "npc")),
  color = fig_cols[2]) +
  annotate("text", x = .8, y = .04, label = "gemiddelde Sociale \n Media nieuwsgebruiker",
           color = fig_cols[2]) +
geom_curve(
  aes(x = .1, y = .0395, xend = .27, yend = .025),
  arrow = arrow(length = unit(0.03, "npc")),
  color = fig_cols[1]) +
  annotate("text", x = .45, y = .025, label = "1 standaard deviatie onder \n gemiddelde Sociale \n Media nieuwsgebruiker",
           color = fig_cols[1]) +
  geom_curve(
    aes(x = .125, y = .0356, xend = .37, yend = .041),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[8]) +
  annotate("text", x = .45, y = .043, label = "1 standaard deviatie boven \n gemiddelde Sociale \n Media nieuwsgebruiker",
           color = fig_cols[8])

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
  select(id, anger, anxiety, smc) %>% 
  group_by(id) %>% 
  summarise(anger_tot = sum(anger, na.rm = T),
            anxiety_tot = sum(anxiety, na.rm = T),
            smc_tot = sum(smc, na.rm = T),
            n_id = n()) %>% 
  mutate(anger_tot = round(anger_tot/n_id,2),
         anxiety_tot = round(anxiety_tot/n_id,2),
         smc_tot = round(smc_tot/n_id,2)) %>% 
  select(id, anxiety_tot, anger_tot, smc_tot)

dm <- left_join(dm, tmp, by = "id")

tmp <- df %>% 
  filter(wave == "wave 1") %>% 
  select(id, media_lit)

dm <- left_join(dm, tmp, by = "id")
dm <- dm %>% 
  mutate(media_lit = replace_na(media_lit, mean(media_lit, na.rm=T)),
         smc = factor(smc))

h3a <- lm(cristal_cs ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)


h3a <- lm(cristal_intra ~ anxiety_tot*smc +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)


h3a <- lm(cristal_inter ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3a <- lm(cons_cs ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3a_2 <- interact_plot(model = h3a, pred = anxiety_tot, 
              modx = smc_tot, interval = F,
              data = dm, colors = fig_cols) +
  labs(y = "Voorspelde waarschijnlijkheid voor versteviging choice-set",
       x = "Mate van angst \n (0 = niet angstig, 1 = zeer angstig") +
  theme_ipsum() +
  theme(legend.position = "none") +
  geom_curve(
    aes(x = .5, y = .058, xend = .8, yend = .0387),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[2]) +
  annotate("text", x = .91, y = .038, label = "gemiddelde Sociale \n Media nieuwsgebruiker",
           color = fig_cols[2]) +
  geom_curve(
    aes(x = .1, y = .065, xend = .45, yend = .07),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[1]) +
  annotate("text", x = .45, y = .075, label = "1 standaard deviatie boven \n gemiddelde Sociale Media nieuwsgebruiker",
           color = fig_cols[1]) +
  geom_curve(
    aes(x = .125, y = .0338, xend = .37, yend = .025),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[8]) +
  annotate("text", x = .55, y = .028, label = "1 standaard deviatie onder  gemiddelde Sociale \n Media nieuwsgebruiker",
           color = fig_cols[8])


h3a <- lm(cons_intra ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3a <- lm(cons_inter ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

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
  select(id, anger, anxiety, smc) %>% 
  group_by(id) %>% 
  summarise(anger_tot = sum(anger, na.rm = T),
            anxiety_tot = sum(anxiety, na.rm = T),
            smc_tot = sum(smc, na.rm = T),
            n_id = n()) %>% 
  mutate(anger_tot = round(anger_tot/n_id,2),
         anxiety_tot = round(anxiety_tot/n_id,2),
         smc_tot = round(smc_tot/n_id, 2)) %>% 
  select(id, anxiety_tot, anger_tot, smc_tot)

dm <- left_join(dm, tmp, by = "id")

tmp <- df %>% 
  filter(wave == "wave 1") %>% 
  select(id, media_lit)

dm <- left_join(dm, tmp, by = "id")
dm <- dm %>% 
  mutate(media_lit = replace_na(media_lit, mean(media_lit, na.rm=T)),
         smc = factor(smc)) %>% 
  filter(wave == "wave 4")


h3b <- lm(conv_cs ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3b <- lm(conv_intra ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3b <- lm(conv_inter ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3b_1 <- interact_plot(model = h3b, pred = anger_tot, 
                       modx = smc_tot, interval = F,
                       data = dm, colors = fig_cols) +
  labs(y = "Voorspelde waarschijnlijkheid voor conversie inter-blok",
       x = "Mate van woede \n (0 = niet woedend, 1 = zeer woedend") +
  theme_ipsum() +
  theme(legend.position = "bottom") +
  geom_curve(
    aes(x = .45, y = .034, xend = .53, yend = .022),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[1]) +
  annotate("text", x = .7, y = .022, label = "1 standaard deviatie onder \n gemiddelde Sociale Media nieuwsgebruiker",
           color = fig_cols[1]) +
  geom_curve(
    aes(x = .05, y = .042, xend = .125, yend = .03),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[2]) +
  annotate("text", x = .25, y = .03, label = "gemiddelde Sociale \n Media nieuwsgebruiker",
           color = fig_cols[2]) +
  geom_curve(
    aes(x = .1, y = .04, xend = .45, yend = .0435),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[8]) +
  annotate("text", x = .45, y = .045, label = "1 standaard deviatie boven \n gemiddelde Sociale Media nieuwsgebruiker",
           color = fig_cols[8]) 


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
  select(id, anger, anxiety, smc) %>% 
  group_by(id) %>% 
  summarise(anger_tot = sum(anger, na.rm = T),
            anxiety_tot = sum(anxiety, na.rm = T),
            smc_tot = sum(smc, na.rm = T),
            n_id = n()) %>% 
  mutate(anger_tot = round(anger_tot/n_id,2),
         anxiety_tot = round(anxiety_tot/n_id,2),
         smc_tot = round(smc_tot/n_id, 2)) %>% 
  select(id, anxiety_tot, anger_tot, smc_tot)

dm <- left_join(dm, tmp, by = "id")

tmp <- df %>% 
  filter(wave == "wave 1") %>% 
  select(id, media_lit)

dm <- left_join(dm, tmp, by = "id")
dm <- dm %>% 
  mutate(media_lit = replace_na(media_lit, mean(media_lit, na.rm=T)),
         smc = factor(smc))

h3b <- lm(cristal_cs ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3b <- lm(cristal_intra ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3b <- lm(cristal_inter ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3b <- lm(cons_cs ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3b <- lm(cons_intra ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3b <- lm(cons_inter ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

