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
         region = recode(region,
                         `North  of the country` = "Noord-NL",
                         `East  of the country` = "Oost-NL",
                         `South  of the country` = "Zuid-NL",
                         `West of the country` = "West-NL",
                         `Three big cities (Amsterdam, Rotterdam, The Hague)` = "Grote Steden (Amsterdam, Rotterdam, The Hague)"),
         region = factor(region,
                         levels = c("Noord-NL",
                                    "Oost-NL",
                                    "Zuid-NL",
                                    "West-NL",
                                    "Grote Steden (Amsterdam, Rotterdam, The Hague)")),
         education = recode(education,
                            `Low` = "Laag",
                            `Medium` = "Midden",
                            `High` = "Hoog"),
         education = factor(education,
                            levels = c("Laag", "Midden", "Hoog")),
         urbanisation = recode(urbanisation,
                               `Not urbanised` = "Niet",
                               `Lowly urbanised` = "Weinig",
                               `Medium urbanised` = "Matig",
                               `Strongly urbanised` = "Sterk",
                               `Very strongly urbanised` = "Zeer Sterk"),
         urbanisation = factor(urbanisation,
                               levels = c("Niet",
                                          "Weinig",
                                          "Matig",
                                          "Sterk",
                                          "Zeer Sterk")),
         sex = recode(sex, `Male` = "Man", `Female` = "Vrouw"),
         ethnicity = recode(ethnicity,
                            `Dutch` = "Nederlands",
                            `Non-Western Migrant` = "Niet-Westerse Afkomst",
                            `Western Migrant` = "Westerse Afkomst")) %>% 
  select(`Profiel` = smc,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Profiel, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p1 <- ggbivariate(tmp, 
            outcome = "Profiel",
            explanatory = c("Leeftijd","Gender","Opleiding",
                            "Ethniciteit", "Regio", "Stedelijkheid"),
            rowbar_args = list(
              colour = "white",
              size = 2)) +
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
         hours_sm = recode(hours_sm,
                           `Less than 10 minutes` = "Minder dan 10 minuten",
                           `1 to 2 hours` = "1 tot 2 uur",
                           `2 to 3 hours` = "2 tot 3 uur",
                           `More than 3 hours` = "Meer dan 3 uur"),
         hours_sm = factor(hours_sm,
                           levels = c("Minder dan 10 minuten",
                                      "1 tot 2 uur",
                                      "2 tot 3 uur",
                                      "Meer dan 3 uur")),
         hours_sm = replace_na(hours_sm, "1 tot 2 uur"),
         sm = 8 - sm) %>% 
  select(`Profiel` = smc,
          `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Profiel)

p2 <- ggbivariate(tmp, 
                  outcome = "Profiel",
                  explanatory = c("Politieke Kleur", "Politiek Vertouwen", 
                                  "Politieke Kennis", "Media Geletterdheid",
                                  "Sociale Media Gebruik"),
                  rowbar_args = list(
                    colour = "white",
                    size = 2)) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
