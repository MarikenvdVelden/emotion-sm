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
h3a <- broom::tidy(lm(conv_cs ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3a",
         emotie = "Anxiety",
         dv = "Conversion",
         id = "Choice-Set")


tmp <- broom::tidy(lm(conv_intra ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3a",
         emotie = "Anxiety",
         dv = "Conversion",
         id = "Intra-Block")

h3a <- h3a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm))%>% 
  mutate(hyp = "Dutch Study - H3a",
         emotie = "Anxiety",
         dv = "Conversion",
         id = "Inter-Block")

h3a <- h3a %>% 
  add_case(tmp)

tmp <- lm(conv_inter ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3a_1 <- interact_plot(model = tmp, pred = anxiety_tot, 
              modx = smc_tot, interval = F,
              data = dm, colors = fig_cols) +
  labs(y = "Predicted probabilty of inter-block conversion",
       x = "Anxiety \n (0 = not anxious, 1 = very anxious") +
  theme_ipsum() +
  theme(legend.position = "none") +
geom_curve(
  aes(x = .5, y = .036, xend = .8, yend = .0387),
  arrow = arrow(length = unit(0.03, "npc")),
  color = fig_cols[2]) +
  ggplot2::annotate("text", x = .8, y = .04, label = "Mean Social \n Media News Users",
           color = fig_cols[2]) +
geom_curve(
  aes(x = .1, y = .0395, xend = .27, yend = .025),
  arrow = arrow(length = unit(0.03, "npc")),
  color = fig_cols[1]) +
  ggplot2::annotate("text", x = .45, y = .025, label = "-1 SD",
           color = fig_cols[1]) +
  geom_curve(
    aes(x = .125, y = .0356, xend = .37, yend = .041),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[8]) +
  ggplot2::annotate("text", x = .45, y = .043, label = "+1 SD",
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

tmp <- broom::tidy(lm(cristal_cs ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3a",
         emotie = "Anxiety",
         dv = "Cristalization",
         id = "Choice-Set")

h3a <- h3a %>% 
  add_case(tmp)


tmp <- broom::tidy(lm(cristal_intra ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3a",
         emotie = "Anxiety",
         dv = "Cristalization",
         id = "Intra-Block")

h3a <- h3a %>% 
  add_case(tmp)


tmp <- broom::tidy(lm(cristal_inter ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3a",
         emotie = "Anxiety",
         dv = "Cristalization",
         id = "Inter-Block")

h3a <- h3a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3a",
         emotie = "Anxiety",
         dv = "Consolidation",
         id = "Choice-Set")

h3a <- h3a %>% 
  add_case(tmp)

tmp <- lm(cons_cs ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3a_2 <- interact_plot(model = tmp, pred = anxiety_tot, 
              modx = smc_tot, interval = F,
              data = dm, colors = fig_cols) +
  labs(y = "Predicted probabilty of coonsolidation choice-set",
       x = "Anxiety \n (0 = not anxious, 1 = very anxious") +
  theme_ipsum() +
  theme(legend.position = "none") +
  geom_curve(
    aes(x = .5, y = .058, xend = .8, yend = .0387),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[2]) +
  ggplot2::annotate("text", x = .8, y = .04, label = "Mean Social \n Media News Users",
                    color = fig_cols[2]) +
  geom_curve(
    aes(x = .1, y = .0395, xend = .27, yend = .025),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[1]) +
  ggplot2::annotate("text", x = .45, y = .025, label = "-1 SD",
                    color = fig_cols[1]) +
  geom_curve(
    aes(x = .125, y = .0356, xend = .37, yend = .041),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[8]) +
  ggplot2::annotate("text", x = .45, y = .043, label = "+1 SD",
                    color = fig_cols[8])

tmp <- broom::tidy(lm(cons_intra ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3a",
         emotie = "Anxiety",
         dv = "Consolidation",
         id = "Intra-Block")

h3a <- h3a %>% 
  add_case(tmp)


tmp <- broom::tidy(lm(cons_inter ~ anxiety_tot*smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3a",
         emotie = "Anxiety",
         dv = "Consolidation",
         id = "Inter-Block")

h3a <- h3a %>% 
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


h3b <-broom::tidy(lm(conv_cs ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3b",
         emotie = "Anger",
         dv = "Conversion",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3b",
         emotie = "Anger",
         dv = "Conversion",
         id = "Intra-Block")

h3b <- h3b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3b",
         emotie = "Anger",
         dv = "Conversion",
         id = "Inter-Block")

h3b <- h3b %>% 
  add_case(tmp)

tmp <- lm(conv_inter ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)

h3b_1 <- interact_plot(model = tmp, pred = anger_tot, 
                       modx = smc_tot, interval = F,
                       data = dm, colors = fig_cols) +
  labs(y = "Predicted probability of conversion inter-block",
       x = "Anger \n (0 = not angry, 1 = very angry") +
  theme_ipsum() +
  theme(legend.position = "bottom") +
  geom_curve(
    aes(x = .45, y = .034, xend = .53, yend = .022),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[1]) +
  ggplot2::annotate("text", x = .8, y = .04, label = "Mean Social \n Media News Users",
                    color = fig_cols[2]) +
  geom_curve(
    aes(x = .1, y = .0395, xend = .27, yend = .025),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[1]) +
  ggplot2::annotate("text", x = .45, y = .025, label = "-1 SD",
                    color = fig_cols[1]) +
  geom_curve(
    aes(x = .125, y = .0356, xend = .37, yend = .041),
    arrow = arrow(length = unit(0.03, "npc")),
    color = fig_cols[8]) +
  ggplot2::annotate("text", x = .45, y = .043, label = "+1 SD",
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

tmp <- broom::tidy(lm(cristal_cs ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3b",
         emotie = "Anger",
         dv = "Cristalization",
         id = "Choice-Set")

h3b <- h3b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3b",
         emotie = "Anger",
         dv = "Cristalization",
         id = "Intra-Block")

h3b <- h3b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3b",
         emotie = "Anger",
         dv = "Cristalization",
         id = "Inter-Block")

h3b <- h3b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3b",
         emotie = "Anger",
         dv = "Consolidation",
         id = "Choice-Set")

h3b <- h3b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3b",
         emotie = "Anger",
         dv = "Consolidation",
         id = "Intra-Block")

h3b <- h3b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ anger_tot * smc_tot +
            age + factor(sex) +
            factor(ethnicity) +
            factor(education) +
            factor(region) +
            factor(urbanisation) +
            media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H3b",
         emotie = "Anger",
         dv = "Consolidation",
         id = "Inter-Block")

h3b <- h3b %>% 
  add_case(tmp)

h3 <- h3a %>% 
  add_case(h3b) %>% 
  filter(term %in% c("anxiety_tot", "anger_tot",
                     "smc_tot",
                     "anxiety_tot:smc_tot",
                     "anger_tot:smc_tot")) %>% 
  mutate(term = recode(term,
                       `anger_tot` = "Political Sentiment",
                       `anxiety_tot` = "Political Sentiment",
                       `smc_tot` = "Social Media News Use",
                       `anxiety_tot:smc_tot` = "Interaction",
                       `anger_tot:smc_tot` = "Interaction"),
         term = factor(term,
                       levels = c("Interaction",
                                  "Social Media News Use", 
                                  "Political Sentiment")),
         upper = (estimate + (1.56*std.error)),
         lower = (estimate - (1.56*std.error))) %>% 
  ggplot(aes(x = estimate, y = term,
             xmin = lower, xmax = upper,
             color = id)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "Interaction Effect of Political Sentiment and Social Media News Use on Volatility \n \n Analyses are controled for demographic variables: \n gender, age, education, ethnicity, region and media literacy",
       y = "") +
  scale_color_manual(values = fig_cols) +
  facet_grid(dv~emotie) +
  theme(legend.position = "bottom",
        legend.title = element_blank()) +
  geom_vline(xintercept = 0, linetype = "dashed", linewidth = .7, color = "lightgray")

