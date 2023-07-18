tmp <- d1 %>%
  mutate(
    sex = case_when(
      sex == 0 ~ "Male",
      sex == 1 ~ "Female"),
    age = 2018 - age,
    Volatility = "None",
    Volatility = ifelse(vol_cs == 1, "Volatility within Choice-Set", Volatility),
    Volatility = ifelse(vol_intra == 1, "Volatility within Ideological Blocks",Volatility),
    Volatility = ifelse(vol_inter == 1, "Volatility between Ideological Blocks",Volatility)) %>% 
  select(Volatility,
         Gender = sex, Age = age, Education = education,
         Country = country) %>% 
  drop_na()

p1a <- ggbivariate(tmp, 
                  outcome = "Volatility",
                  explanatory = c("Age","Gender","Education",
                                  "Country"),
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

tmp <- d1 %>%
  mutate(
    sex = case_when(
      sex == 0 ~ "Male",
      sex == 1 ~ "Female"),
    age = 2018 - age,
    Volatility = "None/ Other",
    Volatility = ifelse(vol_cs == 1, "Volatility within Choice-Set", Volatility)) %>% 
  select(Volatility,
         Gender = sex, Age = age, Education = education,
         Country = country) %>% 
  drop_na()

p1b <- ggbivariate(tmp, 
                   outcome = "Volatility",
                   explanatory = c("Age","Gender","Education",
                                   "Country"),
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

tmp <- d1 %>%
  pivot_longer(cols = vol_intra:vol_cs,
               names_to = "Volatility") %>% 
  filter(value == 1) %>% 
  mutate(Volatility = case_when(
    Volatility == "vol_intra" ~ "Volatility within Ideological Blocks",
    Volatility == "vol_inter" ~ "Volatility between Ideological Blocks",
    Volatility == "vol_cs" ~ "Volatility within Choice Set")) %>% 
  select(Country = country, Volatility) %>% 
  group_by(Country, Volatility) %>% 
  count() %>% 
  ungroup()

countries <- d1 %>% 
  group_by(country) %>% 
  count() %>% 
  select(Country = country,
         tot = n)

tmp <- left_join(tmp, countries, by="Country")

p2 <- tmp %>% 
  mutate(perc = n/tot) %>% 
  ggplot(aes(y = Country, x = perc,
             fill = Volatility)) +
  geom_col() +
  theme_ipsum() +
  labs(x = "", y = "") +
  facet_wrap(vars(Volatility), ncol = 3, scales = "free") +
  scale_fill_manual(values = fig_cols) +
  scale_color_manual(values = fig_cols) +
  scale_x_continuous(labels = scales::percent_format(accuracy = 1)) +
  theme(legend.title = element_blank(),
        legend.position = "none")

