tmp <- df %>% 
  mutate(anxiety = recode(anxiety,
                          `1` = "Angstig",
                          `0` = "Niet Angstig"),
         anxiety = factor(anxiety,
                          levels = c("Angstig",
                                     "Niet Angstig")),
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
  select(`Angst` = anxiety,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Angst, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p1 <- ggbivariate(tmp, 
                  outcome = "Angst",
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
  mutate(anxiety = recode(anxiety,
                          `1` = "Angstig",
                          `0` = "Niet Angstig"),
         anxiety = factor(anxiety,
                          levels = c("Angstig",
                                     "Niet Angstig")),
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
  select(`Angst` = anxiety,
         `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Angst)

p2 <- ggbivariate(tmp, 
                  outcome = "Angst",
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
  mutate(anger = recode(anger,
                        `1` = "Woedend",
                        `0` = "Niet Woedend"),
         angeer = factor(anger,
                         levels = c("Woedend",
                                    "Niet Woedend")),
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
  select(`Woede` = anger,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Woede, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p3 <- ggbivariate(tmp, 
                  outcome = "Woede",
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
  mutate(anger = recode(anger,
                          `1` = "Woedend",
                          `0` = "Niet Woedend"),
         angeer = factor(anger,
                          levels = c("Woedend",
                                     "Niet Woedend")),
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
  select(`Woede` = anger,
         `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Woede)

p4 <- ggbivariate(tmp, 
                  outcome = "Woede",
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
  mutate(sm = 8 - sm,
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
  select(`Angst` = anxiety_tot,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Angst, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p1b <- ggbivariate(tmp, 
                  outcome = "Angst",
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
  mutate(hours_sm = recode(hours_sm,
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
  select(`Angst` = anxiety_tot,
         `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Angst)

p2b <- ggbivariate(tmp, 
                  outcome = "Angst",
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
  mutate(sm = 8 - sm,
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
  select(`Woede` = anger_tot,
         Gender = sex, Leeftijd = age, Opleiding = education,
         Ethniciteit = ethnicity, Regio = region, 
         Stedelijkheid = urbanisation, `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Woede, Gender, Leeftijd, Opleiding, 
          Ethniciteit, Regio, Stedelijkheid)

p3b <- ggbivariate(tmp, 
                  outcome = "Woede",
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
  mutate(hours_sm = recode(hours_sm,
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
  select(`Woede` = anger_tot,
         `Politieke Kleur` = ideology,
         `Politiek Vertouwen` = trust, `Politieke Kennis` = pol_know,
         `Media Geletterdheid` = media_lit, 
         `Sociale Media Gebruik` = hours_sm) %>% 
  drop_na(Woede)

p4b <- ggbivariate(tmp, 
                  outcome = "Woede",
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

