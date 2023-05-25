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
  select(anxiety_tot, anger_tot,
         age, sex, ethnicity,
         education, region, urbanisation, hours_sm, id, wave) %>% 
  mutate(anxiety_tot = replace_na(anxiety_tot, mean(anxiety_tot, na.rm=T)),
         anger_tot = replace_na(anger_tot, mean(anger_tot, na.rm=T)),
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
                        #junkie_tot + tmu_tot + na_tot +
                                age + factor(sex) +
                                factor(ethnicity) +
                                factor(education) +
                                factor(region) +
                                factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "H1a",
         dv = "Angst") 

h1b <- broom::tidy(lm(anger_tot ~ smc_tot +
                       # junkie_tot + tmu_tot + na_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, data= dm)) %>% 
  mutate(hyp = "H1b",
         dv = "Woede") 

h1 <- h1a %>% add_case(h1b) %>% 
  filter(term %in% c("smc_tot")) %>% 
                     #"junkie_tot","tmu_tot", "na_tot")) %>% 
  mutate(term = recode(term,
                       `smc_tot` = "Social Media Nieuws Gebruiker",
                       `junkie_tot` = "Nieuws Junkie",
                       `na_tot` = "Nieuwsmijder",
                       `tmu_tot` = "Traditionele Media Nieuws Gebruiker"),
         upper = (estimate + (1.96*std.error)),
         lower = (estimate - (1.96*std.error)),
         id = "Hypothese 1") %>% 
  ggplot(aes(x = estimate, y = dv,
             xmin = lower, xmax = upper,
             color = dv)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "Effect van Sociale Media Nieuwsgebruiker op Emotie",
      y = "Afhankelijke Variabele: Emotie",
      caption = "Analyses zijn gecontroleerd voor demografische variabelen: \n geslacht, leeftijd, opleiding, ethniciteit, regio en mediageletterdheid") +
  scale_color_manual(values = fig_cols) +
  #facet_grid(id~.) +
  theme(legend.position = "none",
        legend.title = element_blank()) +
  geom_vline(xintercept = 0, linetype = "dashed", linewidth = .7, color = "lightgray")

h1a <- lm(anxiety_tot ~ smc_tot*media_lit +
            #junkie_tot + tmu_tot + na_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation), dm)

h1a_e <- interact_plot(model = h1a, pred = smc_tot, 
                                 modx = media_lit, interval = F,
                                 data = dm, colors = fig_cols) +
  labs(y = "Voorspelde waarschijnlijkheid dat angst gerapporteerd wordt",
       x = "Mate van Sociale Media Nieuwsgebruiker \n (0 = valt nooit in deze categorie, 1 = valt altijd in deze categorie") +
  theme_ipsum() +
  theme(legend.position = "none") +
  ylim(c(.1, .5)) +
  geom_curve(
    aes(x = .35, y = .305, xend = .5, yend = .235),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[5]) +
  annotate("text", x = .75, y = .235, label = "Gemiddelde mediageletterdheid",
           color = fig_cols[5]) +
  geom_curve(
    aes(x = .1, y = .225, xend = .3, yend = .15),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[3]) +
  annotate("text", x = .5, y = .15, label = "1 standaard deviatie onder \n gemiddelde Mediageletterdheid",
           color = fig_cols[3]) +
  geom_curve(
    aes(x = .1, y = .42, xend = .3, yend = .35),
    arrow = arrow(length = unit(0.03, "npc")),
    color = "purple") +
  annotate("text", x = .5, y = .35, label = "1 standaard deviatie boven \n gemiddelde Mediageletterdheid",
           color = "purple")


h1b <- lm(anger_tot ~ smc_tot*media_lit +
            #junkie_tot + tmu_tot + na_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation), dm)

h1b_e <- interact_plot(model = h1b, pred = smc_tot, 
                       modx = media_lit, interval = F,
                       data = dm, colors = fig_cols) +
  labs(y = "Voorspelde waarschijnlijkheid dat woede gerapporteerd wordt",
       x = "Mate van Sociale Media Nieuwsgebruiker \n (0 = valt nooit in deze categorie, 1 = valt altijd in deze categorie") +
  theme_ipsum() +
  theme(legend.position = "none") +
  geom_curve(
    aes(x = .35, y = .365, xend = .5, yend = .28),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[5]) +
  annotate("text", x = .75, y = .28, label = "Gemiddelde mediageletterdheid",
           color = fig_cols[5]) +
  geom_curve(
    aes(x = .1, y = .23, xend = .3, yend = .15),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[3]) +
  annotate("text", x = .5, y = .15, label = "1 standaard deviatie onder \n gemiddelde Mediageletterdheid",
           color = fig_cols[3]) +
  geom_curve(
    aes(x = .1, y = .535, xend = .3, yend = .45),
    arrow = arrow(length = unit(0.03, "npc")),
    color = "purple") +
  annotate("text", x = .5, y = .45, label = "1 standaard deviatie boven \n gemiddelde Mediageletterdheid",
           color = "purple")

dm <- dm %>% 
  mutate(hours_sm = factor(hours_sm))

h1c <- lm(anxiety_tot ~ smc_tot*hours_sm +
            #junkie_tot + tmu_tot + na_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) + media_lit, dm)

h1c_e <- interact_plot(model = h1c, pred = smc_tot, 
                       modx = hours_sm, interval = F,
                       data = dm, colors = fig_cols) +
  labs(y = "Voorspelde waarschijnlijkheid dat angst gerapporteerd wordt",
       x = "Mate van Sociale Media Nieuwsgebruiker \n (0 = valt nooit in deze categorie, 1 = valt altijd in deze categorie") +
  theme_ipsum() +
  theme(legend.position = "none") +
  geom_curve(
    aes(x = .15, y = .22, xend = .11, yend = .0),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[4]) +
  annotate("text", x = .25, y = .0, label = "> 3 uur per dag \n actief op SM",
           color = fig_cols[4]) +
  geom_curve(
    aes(x = .95, y = .27, xend = .75, yend = .35),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[1]) +
  annotate("text", x = .63, y = .35, label = "1-2 uur per dag \n actief op SM",
           color = fig_cols[1]) +
  geom_curve(
    aes(x = .5, y = .265, xend = .75, yend = .15),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[2]) +
  annotate("text", x = .87, y = .15, label = "2-3 uur per dag \n actief op SM",
           color = fig_cols[2]) +
  geom_curve(
    aes(x = .3, y = .265, xend = .75, yend = 0),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[3]) +
  annotate("text", x = .87, y = -0, label = "< 10 min. per dag \n actief op SM",
           color = fig_cols[3])


h1d <- lm(anger_tot ~ smc_tot*hours_sm +
            #junkie_tot + tmu_tot + na_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) + media_lit +
            factor(urbanisation), dm)

h1d_e <- interact_plot(model = h1d, pred = smc_tot, 
              modx = hours_sm, interval = F,
              data = dm, colors = fig_cols) +
  labs(y = "Voorspelde waarschijnlijkheid dat woede gerapporteerd wordt",
       x = "Mate van Sociale Media Nieuwsgebruiker \n (0 = valt nooit in deze categorie, 1 = valt altijd in deze categorie") +
  theme_ipsum() +
  theme(legend.position = "none") +
    geom_curve(
      aes(x = .1, y = .365, xend = .25, yend = .0),
      arrow = arrow(length = unit(0.03, "npc")),
      color = fig_cols[4]) +
    annotate("text", x = .37, y = .0, label = "> 3 uur per dag \n actief op SM",
             color = fig_cols[4]) +
    geom_curve(
      aes(x = .95, y = .34, xend = .75, yend = .45),
      arrow = arrow(length = unit(0.03, "npc")),
      color = fig_cols[1]) +
    annotate("text", x = .63, y = .45, label = "1-2 uur per dag \n actief op SM",
             color = fig_cols[1]) +
    geom_curve(
      aes(x = .5, y = .3, xend = .65, yend = .2),
      arrow = arrow(length = unit(0.03, "npc")),
      color = fig_cols[2]) +
    annotate("text", x = .78, y = .2, label = "2-3 uur per dag \n actief op SM",
             color = fig_cols[2]) +
    geom_curve(
      aes(x = .3, y = .355, xend = .75, yend = .1),
      arrow = arrow(length = unit(0.03, "npc")),
      color = fig_cols[3]) +
    annotate("text", x = .87, y = .1, label = "< 10 min. per dag \n actief op SM",
             color = fig_cols[3])
  
