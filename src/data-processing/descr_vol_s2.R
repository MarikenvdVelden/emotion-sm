#Conversion Volatility
tmp <- df %>%
  mutate(Conversion = "No Conversion",
         Conversion = ifelse(conv_cs == 1, "Conversion within Choice-Set", Conversion),
         Conversion = ifelse(conv_inter == 1, "Conversion within Ideological Blocks",Conversion),
         Conversion = ifelse(conv_intra == 1, "Conversion between Ideological Blocks",Conversion),
         sm = 8 - sm,
         region = factor(region,
                         levels = c("North  of the country",
                                    "East  of the country",
                                    "South  of the countr",
                                    "West of the country",
                                    "Three big cities (Amsterdam, Rotterdam, The Hague)")),
         education = factor(education,
                            levels = c("Low", "Medium", "High")),
         urbanisation = factor(urbanisation,
                               levels = c("Not urbanised",
                                          "Lowly urbanised",
                                          "Medium urbanised",
                                          "Strongly urbanised",
                                          "Very strongly urbanised"))) %>% 
  select(Conversion,
         Gender = sex, Age = age, Education = education,
         Ethnicity= ethnicity, Region = region, 
         Urbanisation = urbanisation, `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Conversion, Gender, Age, Education, 
          Ethnicity, Region, Urbanisation)

p1 <- ggbivariate(tmp, 
                  outcome = "Conversion",
                  explanatory = c("Age","Gender","Education",
                                  "Ethnicity", "Region", "Urbanisation"),
                  rowbar_args = list(
                    colour = "white",
                    size = 2,
                    label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

tmp <- df %>%
  mutate(Conversion = "No/Other Conversie",
         Conversion = ifelse(conv_cs == 1, "Conversion within Choice-Set", Conversion),
         sm = 8 - sm,
         region = factor(region,
                         levels = c("North  of the country",
                                    "East  of the country",
                                    "South  of the countr",
                                    "West of the country",
                                    "Three big cities (Amsterdam, Rotterdam, The Hague)")),
         education = factor(education,
                            levels = c("Low", "Medium", "High")),
         urbanisation = factor(urbanisation,
                               levels = c("Not urbanised",
                                          "Lowly urbanised",
                                          "Medium urbanised",
                                          "Strongly urbanised",
                                          "Very strongly urbanised"))) %>% 
  select(Conversion,
         Gender = sex, Age = age, Education = education,
         Ethnicity= ethnicity, Region = region, 
         Urbanisation = urbanisation, `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Conversion, Gender, Age, Education, 
          Ethnicity, Region, Urbanisation)

p1b <- ggbivariate(tmp, 
                   outcome = "Conversion",
                   explanatory = c("Age","Gender","Education",
                                   "Ethnicity", "Region", "Urbanisation"),
                   rowbar_args = list(
                     colour = "white",
                     size = 2,
                     label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


tmp <- df %>% 
  mutate(Conversion = "No Conversion",
         Conversion = ifelse(conv_cs == 1, "Conversion within Choice-Set", Conversion),
         Conversion = ifelse(conv_inter == 1, "Conversion within Ideological Blocks",Conversion),
         Conversion = ifelse(conv_intra == 1, "Conversion between Ideological Blocks",Conversion),
         hours_sm = factor(hours_sm,
                           levels = c("Less than 10 minutes",
                                      "1 to 2 hours",
                                      "2 to 3 hours",
                                      "More than 3 hours")),
         hours_sm = replace_na(hours_sm, "1 to 2 hours"),
         sm = 8 - sm) %>% 
  select(`Conversion`,
         `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Conversion)

p2 <- ggbivariate(tmp, 
                  outcome = "Conversion",
                  explanatory = c("Ideology", "Political Trust", 
                                  "Political Knowledge", "Media Literacy",
                                  "Sociale Media Usage"),
                  rowbar_args = list(
                    colour = "white",
                    size = 2,
                    label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

tmp <- df %>% 
  mutate(Conversion = "No/Other Conversion",
         Conversion = ifelse(conv_cs == 1, "Conversion within Choice-Set", Conversion),
         hours_sm = factor(hours_sm,
                           levels = c("Less than 10 minutes",
                                      "1 to 2 hours",
                                      "2 to 3 hours",
                                      "More than 3 hours")),
         hours_sm = replace_na(hours_sm, "1 to 2 hours"),
         sm = 8 - sm) %>% 
  select(`Conversion`,
         `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Conversion)

p2b <- ggbivariate(tmp, 
                   outcome = "Conversion",
                   explanatory = c("Ideology", "Political Trust", 
                                   "Political Knowledge", "Media Literacy",
                                   "Sociale Media Usage"),
                   rowbar_args = list(
                     colour = "white",
                     size = 2,
                     label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


#Cristalization
tmp <- df %>%
  mutate(Cristalization = "No Cristalization",
         Cristalization = ifelse(cristal_cs == 1, "Cristalization within Choice-Set", Cristalization),
         Cristalization = ifelse(cristal_intra == 1, "Cristalization within Ideological Blocks",Cristalization),
         Cristalization = ifelse(cristal_inter == 1, "Cristalization between Ideological Blocks",Cristalization),
         sm = 8 - sm,
         region = factor(region,
                         levels = c("North  of the country",
                                    "East  of the country",
                                    "South  of the countr",
                                    "West of the country",
                                    "Three big cities (Amsterdam, Rotterdam, The Hague)")),
         education = factor(education,
                            levels = c("Low", "Medium", "High")),
         urbanisation = factor(urbanisation,
                               levels = c("Not urbanised",
                                          "Lowly urbanised",
                                          "Medium urbanised",
                                          "Strongly urbanised",
                                          "Very strongly urbanised"))) %>% 
  select(Cristalization,
         Gender = sex, Age = age, Education = education,
         Ethnicity= ethnicity, Region = region, 
         Urbanisation = urbanisation, `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Cristalization, Gender, Age, Education, 
          Ethnicity, Region, Urbanisation)

p3 <- ggbivariate(tmp, 
                  outcome = "Cristalization",
                  explanatory = c("Age","Gender","Education",
                                  "Ethnicity", "Region", "Urbanisation"),
                  rowbar_args = list(
                    colour = "white",
                    size = 2,
                    label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) 

tmp <- df %>%
  mutate(Cristalization = "No/Other Cristalization",
         Cristalization = ifelse(cristal_cs == 1, "Cristalization within Choice-Set", Cristalization), sm = 8 - sm,
         region = factor(region,
                         levels = c("North  of the country",
                                    "East  of the country",
                                    "South  of the countr",
                                    "West of the country",
                                    "Three big cities (Amsterdam, Rotterdam, The Hague)")),
         education = factor(education,
                            levels = c("Low", "Medium", "High")),
         urbanisation = factor(urbanisation,
                               levels = c("Not urbanised",
                                          "Lowly urbanised",
                                          "Medium urbanised",
                                          "Strongly urbanised",
                                          "Very strongly urbanised"))) %>% 
  select(Cristalization,
         Gender = sex, Age = age, Education = education,
         Ethnicity= ethnicity, Region = region, 
         Urbanisation = urbanisation, `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Cristalization, Gender, Age, Education, 
          Ethnicity, Region, Urbanisation)

p3b <- ggbivariate(tmp, 
                   outcome = "Cristalization",
                   explanatory = c("Age","Gender","Education",
                                   "Ethnicity", "Region", "Urbanisation"),
                   rowbar_args = list(
                     colour = "white",
                     size = 2,
                     label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

tmp <- df %>% 
  mutate(Cristalization = "No Cristalization",
         Cristalization = ifelse(cristal_cs == 1, "Cristalization within Choice-Set", Cristalization),
         Cristalization = ifelse(cristal_intra == 1, "Cristalization within Ideological Blocks",Cristalization),
         Cristalization = ifelse(cristal_inter == 1, "Cristalization between Ideological Blocks",Cristalization),
         hours_sm = factor(hours_sm,
                           levels = c("Less than 10 minutes",
                                      "1 to 2 hours",
                                      "2 to 3 hours",
                                      "More than 3 hours")),
         hours_sm = replace_na(hours_sm, "1 to 2 hours"),
         sm = 8 - sm) %>% 
  select(Cristalization,
         `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Cristalization)

p4 <- ggbivariate(tmp, 
                  outcome = "Cristalization",
                  explanatory = c("Ideology", "Political Trust", 
                                  "Political Knowledge", "Media Literacy",
                                  "Sociale Media Usage"),
                  rowbar_args = list(
                    colour = "white",
                    size = 2,
                    label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

tmp <- df %>% 
  mutate(Cristalization = "No/Other Cristalization",
         Cristalization = ifelse(cristal_cs == 1, "Cristalization within Choice-Set", Cristalization),
         sm = 8 - sm,
         hours_sm = factor(hours_sm,
                           levels = c("Less than 10 minutes",
                                      "1 to 2 hours",
                                      "2 to 3 hours",
                                      "More than 3 hours")),
         hours_sm = replace_na(hours_sm, "1 to 2 hours"),
         sm = 8 - sm) %>% 
  select(Cristalization,
         `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Cristalization)

p4b <- ggbivariate(tmp, 
                   outcome = "Cristalization",
                   explanatory = c("Ideology", "Political Trust", 
                                   "Political Knowledge", "Media Literacy",
                                   "Sociale Media Usage"),
                   rowbar_args = list(
                     colour = "white",
                     size = 2,
                     label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

# Consolidation
tmp <- df %>%
  mutate(Consolidation = "No Consolidation",
         Consolidation = ifelse(cons_cs == 1, "Consolidation between Choice-Set", Consolidation),
         Consolidation = ifelse(cons_intra == 1, "Consolidation between Ideological Blocks",Consolidation),
         Consolidation = ifelse(cons_inter == 1, "Consolidation within Ideological Blocks",Consolidation),
         sm = 8 - sm,
         region = factor(region,
                         levels = c("North  of the country",
                                    "East  of the country",
                                    "South  of the countr",
                                    "West of the country",
                                    "Three big cities (Amsterdam, Rotterdam, The Hague)")),
         education = factor(education,
                            levels = c("Low", "Medium", "High")),
         urbanisation = factor(urbanisation,
                               levels = c("Not urbanised",
                                          "Lowly urbanised",
                                          "Medium urbanised",
                                          "Strongly urbanised",
                                          "Very strongly urbanised"))) %>% 
  select(Consolidation,
         Gender = sex, Age = age, Education = education,
         Ethnicity= ethnicity, Region = region, 
         Urbanisation = urbanisation, `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Consolidation, Gender, Age, Education, 
          Ethnicity, Region, Urbanisation)

p5 <- ggbivariate(tmp, 
                  outcome = "Consolidation",
                  explanatory = c("Age","Gender","Education",
                                  "Ethnicity", "Region", "Urbanisation"),
                  rowbar_args = list(
                    colour = "white",
                    size = 2,
                    label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

tmp <- df %>%
  mutate(Consolidation = "No/Other Consolidation",
         Consolidation = ifelse(cons_cs == 1, "Consolidation within Choice-Set", Consolidation),
         sm = 8 - sm,
         region = factor(region,
                         levels = c("North  of the country",
                                    "East  of the country",
                                    "South  of the countr",
                                    "West of the country",
                                    "Three big cities (Amsterdam, Rotterdam, The Hague)")),
         education = factor(education,
                            levels = c("Low", "Medium", "High")),
         urbanisation = factor(urbanisation,
                               levels = c("Not urbanised",
                                          "Lowly urbanised",
                                          "Medium urbanised",
                                          "Strongly urbanised",
                                          "Very strongly urbanised"))) %>% 
  select(Consolidation,
         Gender = sex, Age = age, Education = education,
         Ethnicity= ethnicity, Region = region, 
         Urbanisation = urbanisation, `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Consolidation, Gender, Age, Education, 
          Ethnicity, Region, Urbanisation)

p5b <- ggbivariate(tmp, 
                   outcome = "Consolidation",
                   explanatory = c("Age","Gender","Education",
                                   "Ethnicity", "Region", "Urbanisation"),
                   rowbar_args = list(
                     colour = "white",
                     size = 2,
                     label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

tmp <- df %>% 
  mutate(Consolidation = "No Consolidation",
         Consolidation = ifelse(cons_cs == 1, "Consolidation between Choice-Set", Consolidation),
         Consolidation = ifelse(cons_intra == 1, "Consolidation between Ideological Blocks",Consolidation),
         Consolidation = ifelse(cons_inter == 1, "Consolidation within Ideological Blocks",Consolidation),
         hours_sm = factor(hours_sm,
                           levels = c("Less than 10 minutes",
                                      "1 to 2 hours",
                                      "2 to 3 hours",
                                      "More than 3 hours")),
         hours_sm = replace_na(hours_sm, "1 to 2 hours"),
         sm = 8 - sm) %>% 
  select(Consolidation,
         `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Consolidation)

p6 <- ggbivariate(tmp, 
                  outcome = "Consolidation",
                  explanatory = c("Ideology", "Political Trust", 
                                  "Political Knowledge", "Media Literacy",
                                  "Sociale Media Usage"),
                  rowbar_args = list(
                    colour = "white",
                    size = 2,
                    label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

tmp <- df %>% 
  mutate(Consolidation = "No/Other Consolidation",
         Consolidation = ifelse(cons_cs == 1, "Consolidation within Choice-Set", Consolidation),
         hours_sm = recode(hours_sm,
                           `Less than 10 minutes` = "Minder dan 10 minuten",
                           `1 to 2 hours` = "1 tot 2 uur",
                           `2 to 3 hours` = "2 tot 3 uur",
                           `More than 3 hours` = "Meer dan 3 uur"),
         hours_sm = factor(hours_sm,
                           levels = c("Less than 10 minutes",
                                      "1 to 2 hours",
                                      "2 to 3 hours",
                                      "More than 3 hours")),
         hours_sm = replace_na(hours_sm, "1 to 2 hours"),
         sm = 8 - sm) %>% 
  select(Consolidation,
         `Ideology` = ideology,
         `Political Trust` = trust, `Political Knowledge` = pol_know,
         `Media Literacy` = media_lit, 
         `Sociale Media Usage` = hours_sm) %>% 
  drop_na(Consolidation)

p6b <- ggbivariate(tmp, 
                  outcome = "Consolidation",
                  explanatory = c("Ideology", "Political Trust", 
                                  "Political Knowledge", "Media Literacy",
                                  "Sociale Media Usage"),
                  rowbar_args = list(
                    colour = "white",
                    size = 2,
                    label_format = scales::label_percent(accurary = 1))) +
  theme_ipsum() +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

## table
tab <- df %>%
  mutate(Volatility = "No Conversion",
         Volatility = ifelse(conv_cs == 1, "Conversion within Choice-Set", Volatility),
         Volatility = ifelse(conv_inter == 1, "Conversion within Ideological Blocks",Volatility),
         Volatility = ifelse(conv_intra == 1, "Conversion between Ideological Blocks",Volatility)) %>% 
  group_by(Volatility) %>% 
  reframe(n = n()) 

tmp <- df %>% 
  mutate(Volatility = "No Conversion",
         Volatility = ifelse(conv_cs == 1, "Conversion within Choice-Set", Volatility)) %>% 
  group_by(Volatility) %>% 
  reframe(n = n()) %>% 
  filter(Volatility == "Conversion within Choice-Set")

tab <- tab %>% 
  add_case(tmp)

tmp <- df %>%
  mutate(Volatility = "No Cristalization",
         Volatility = ifelse(cristal_cs == 1, "Cristalization within Choice-Set", Volatility),
         Volatility = ifelse(cristal_intra == 1, "Cristalization within Ideological Blocks",Volatility),
         Volatility = ifelse(cristal_inter == 1, "Cristalization between Ideological Blocks",Volatility)) %>% 
  group_by(Volatility) %>% 
  reframe(n = n()) 

tab <- tab %>% 
  add_case(tmp)

tmp <- df %>% 
  mutate(Volatility = "No Cristalization",
         Volatility = ifelse(cristal_cs == 1, "Cristalization within Choice-Set", Volatility)) %>% 
  group_by(Volatility) %>% 
  reframe(n = n()) %>% 
  filter(Volatility == "Cristalization within Choice-Set")

tab <- tab %>% 
  add_case(tmp)

tmp <- df %>%
  mutate(Volatility = "No Consolidation",
         Volatility = ifelse(cons_cs == 1, "Consolidation within Choice-Set", Volatility),
         Volatility = ifelse(cons_intra == 1, "Consolidation within Ideological Blocks",Volatility),
         Volatility = ifelse(cons_inter == 1, "Consolidation between Ideological Blocks",Volatility)) %>% 
  group_by(Volatility) %>% 
  reframe(n = n()) 

tab <- tab %>% 
  add_case(tmp)

tmp <- df %>% 
  mutate(Volatility = "No Consolidation",
         Volatility = ifelse(cons_cs == 1, "Consolidation within Choice-Set", Volatility)) %>% 
  group_by(Volatility) %>% 
  reframe(n = n()) %>% 
  filter(Volatility == "Consolidation within Choice-Set")

tab <- tab %>% 
  add_case(tmp)


p7 <- df %>% 
  pivot_longer(cols = conv_cs:cons_inter,
               names_to = "vol") %>% 
  select(vol, value) %>% 
  filter(value == 1) %>% 
  mutate(vol = case_when(
    vol == "cons_inter" ~ "Consolidation: Inter-Block",
    vol == "cons_intra" ~ "Consolidation: Intra-Block",
    vol == "cons_cs" ~ "Consolidation: Choice-Set",
    vol == "conv_inter" ~ "Conversion: Inter-Block",
    vol == "conv_intra" ~ "Conversion: Intra-Block",
    vol == "conv_cs" ~ "Conversion: Choice-Set",
    vol == "cristal_inter" ~ "Cristalization: Inter-Block",
    vol == "cristal_intra" ~ "Cristalization: Intra-Block",
    vol == "cristal_cs" ~ "Cristalization: Choice-Set")) %>% 
  group_by(vol) %>% 
  count() %>% 
  ungroup() %>% 
  mutate(perc = n/dim(df)[1]) %>% 
  ggplot(aes(y = vol, x = perc,
             fill = vol)) +
  geom_col() +
  theme_ipsum() +
  labs(x = "Volatility", y = "") +
  #facet_wrap(vars(Profile), ncol = 2, scales = "free") +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  scale_x_continuous(labels = scales::percent_format(accuracy = 1)) +
  theme(legend.title = element_blank(),
        legend.position = "none")
