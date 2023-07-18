#h1a2 <- lm(anxiety_tot ~ smc_tot*media_lit +
#junkie_tot + tmu_tot + na_tot +
#            age + factor(sex) +
#            factor(ethnicity) +
#            factor(education) +
#            factor(region) +
#            factor(urbanisation), dm)

#h1a_e <- interact_plot(model = h1a2, pred = smc_tot, 
#                                 modx = media_lit, interval = F,
#                                 data = dm, colors = fig_cols) +
#  labs(y = "Voorspelde waarschijnlijkheid dat angst gerapporteerd wordt",
#       x = "Mate van Sociale Media Nieuwsgebruiker \n (0 = valt nooit in deze categorie, 1 = valt altijd in deze categorie") +
#  theme_ipsum() +
#  theme(legend.position = "none") +
#  ylim(c(.1, .5)) +
#  geom_curve(aes(x = .35, y = .305, xend = .5, yend = .235),
#    arrow = arrow(length = unit(0.03, "npc")),
#    color = fig_cols[5]) +
#  annotate("text", x = .75, y = .235, label = "Mean Media Literacy", color = fig_cols[5]) +
#  geom_curve(aes(x = .1, y = .225, xend = .3, yend = .15),
#    arrow = arrow(length = unit(0.03, "npc")),
#    color = fig_cols[3]) +
#  annotate("text", x = .5, y = .15, label = "-1SD",color = fig_cols[3]) +
#  geom_curve(
#    aes(x = .1, y = .42, xend = .3, yend = .35),
#    arrow = arrow(length = unit(0.03, "npc")),
#    color = "purple") +
#  annotate("text", x = .5, y = .35, label = "+1SD",
#           color = "purple")


h1b2 <- lm(anger_tot ~ smc_tot*media_lit +
             #junkie_tot + tmu_tot + na_tot +
             age + factor(sex) +
             factor(ethnicity) +
             factor(education) +
             factor(region) +
             factor(urbanisation), dm)

h1b_e <- interact_plot(model = h1b2, pred = smc_tot, 
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
