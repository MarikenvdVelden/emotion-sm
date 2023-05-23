tmp <- df %>%
  mutate(Conversie = "Geen Conversie",
         Conversie = ifelse(conv_cs == 1, "Conversie binnen Choice-Set", Conversie),
         Conversie = ifelse(conv_inter == 1, "Conversie binnen Ideologisch Blok",Conversie),
         Conversie = ifelse(conv_intra == 1, "Conversie tusssen Ideologische Blokken",Conversie),
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
  select(Conversie,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Conversie, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p1 <- ggbivariate(tmp, 
                  outcome = "Conversie",
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
  mutate(Conversie = "Geen Conversie",
         Conversie = ifelse(conv_cs == 1, "Conversie binnen Choice-Set", Conversie),
         Conversie = ifelse(conv_inter == 1, "Conversie binnen Ideologisch Blok",Conversie),
         Conversie = ifelse(conv_intra == 1, "Conversie tusssen Ideologische Blokken",Conversie),
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
  select(Conversie,
         `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Conversie)

p2 <- ggbivariate(tmp, 
                  outcome = "Conversie",
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

tmp <- df %>%
  mutate(Kristalisatie = "Geen Kristalisatie",
         Kristalisatie = ifelse(cristal_cs == 1, "Kristalisatie binnen Choice-Set", Kristalisatie),
         Kristalisatie = ifelse(cristal_intra == 1, "Kristalisatie binnen Ideologisch Blok",Kristalisatie),
         Kristalisatie = ifelse(cristal_inter == 1, "Kristalisatie tusssen Ideologische Blokken",Kristalisatie),
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
  select(Kristalisatie,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Kristalisatie, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p3 <- ggbivariate(tmp, 
                  outcome = "Kristalisatie",
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
  mutate(Kristalisatie = "Geen Kristalisatie",
         Kristalisatie = ifelse(cristal_cs == 1, "Kristalisatie binnen Choice-Set", Kristalisatie),
         Kristalisatie = ifelse(cristal_intra == 1, "Kristalisatie binnen Ideologisch Blok",Kristalisatie),
         Kristalisatie = ifelse(cristal_inter == 1, "Kristalisatie tusssen Ideologische Blokken",Kristalisatie),
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
  select(Kristalisatie,
         `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Kristalisatie)

p4 <- ggbivariate(tmp, 
                  outcome = "Kristalisatie",
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

tmp <- df %>%
  mutate(Versteviging = "Geen Versteviging",
         Versteviging = ifelse(cons_cs == 1, "Versteviging binnen Choice-Set", Versteviging),
         Versteviging = ifelse(cons_intra == 1, "Versteviging binnen Ideologisch Blok",Versteviging),
         Versteviging = ifelse(cons_inter == 1, "Versteviging tusssen Ideologische Blokken",Versteviging),
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
  select(Versteviging,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Versteviging, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p5 <- ggbivariate(tmp, 
                  outcome = "Versteviging",
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
  mutate(Versteviging = "Geen Versteviging",
         Versteviging = ifelse(cons_cs == 1, "Versteviging binnen Choice-Set", Versteviging),
         Versteviging = ifelse(cons_intra == 1, "Versteviging binnen Ideologisch Blok",Versteviging),
         Kristalisatie = ifelse(cons_inter == 1, "Versteviging tusssen Ideologische Blokken",Versteviging),
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
  select(Versteviging,
         `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Versteviging)

p6 <- ggbivariate(tmp, 
                  outcome = "Versteviging",
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


tmp <- df %>%
  mutate(Conversie = "Geen/Andere Conversie",
         Conversie = ifelse(conv_cs == 1, "Conversie binnen Choice-Set", Conversie),
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
  select(Conversie,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Conversie, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p1b <- ggbivariate(tmp, 
                  outcome = "Conversie",
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
  mutate(Conversie = "Geen/Andere Conversie",
         Conversie = ifelse(conv_cs == 1, "Conversie binnen Choice-Set", Conversie),
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
  select(Conversie,
         `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Conversie)

pb2 <- ggbivariate(tmp, 
                  outcome = "Conversie",
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

tmp <- df %>%
  mutate(Kristalisatie = "Geen/Andere Kristalisatie",
         Kristalisatie = ifelse(cristal_cs == 1, "Kristalisatie binnen Choice-Set", Kristalisatie), sm = 8 - sm,
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
  select(Kristalisatie,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Kristalisatie, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p3b <- ggbivariate(tmp, 
                  outcome = "Kristalisatie",
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
  mutate(Kristalisatie = "Geen/Andere Kristalisatie",
         Kristalisatie = ifelse(cristal_cs == 1, "Kristalisatie binnen Choice-Set", Kristalisatie), sm = 8 - sm,
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
  select(Kristalisatie,
         `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Kristalisatie)

p4b <- ggbivariate(tmp, 
                  outcome = "Kristalisatie",
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

tmp <- df %>%
  mutate(Versteviging = "Geen/Andere Versteviging",
         Versteviging = ifelse(cons_cs == 1, "Versteviging binnen Choice-Set", Versteviging),
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
  select(Versteviging,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Versteviging, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p5b <- ggbivariate(tmp, 
                  outcome = "Versteviging",
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
  mutate(Versteviging = "Geen/Andere Versteviging",
         Versteviging = ifelse(cons_cs == 1, "Versteviging binnen Choice-Set", Versteviging),
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
  select(Versteviging,
         `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Versteviging)

p6b <- ggbivariate(tmp, 
                  outcome = "Versteviging",
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