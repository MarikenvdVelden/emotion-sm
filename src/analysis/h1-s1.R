h1a <- broom.mixed::tidy(lmer(anxiety ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Anxiety",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

countries <- unique(d1$country)
for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(anxiety ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Anxiety",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1a <- h1a %>% 
    add_case(tmp)
}

#Woede
h1b <- broom.mixed::tidy(lmer(anger ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Anger",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(anger ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Anger",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1b <- h1b %>% 
    add_case(tmp)
}

#Disgust
h1c <- broom.mixed::tidy(lmer(disgust ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Disgust",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(disgust ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Disgust",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1c <- h1c %>% 
    add_case(tmp)
}

#Fear
h1d <- broom.mixed::tidy(lmer(fear ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Fear",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(fear ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Fear",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1d <- h1d %>% 
    add_case(tmp)
}

#Sad
h1e <- broom.mixed::tidy(lmer(sad ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Sadness",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(sad ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Sadness",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1e <- h1e %>% 
    add_case(tmp)
}

#Depressed
h1f <- broom.mixed::tidy(lmer(depressed ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Depression",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(depressed ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Depression",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1f <- h1f %>% 
    add_case(tmp)
}

#Hope
h1g <- broom.mixed::tidy(lmer(hope ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Hope",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(hope ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Hope",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1g <- h1g %>% 
    add_case(tmp)
}

#Proud
h1h <- broom.mixed::tidy(lmer(proud ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Pride",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(proud ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Pride",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1h <- h1h %>% 
    add_case(tmp)
}

#Happy
h1i <- broom.mixed::tidy(lmer(happy ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Happiness",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(happy ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Happiness",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1i <- h1i %>% 
    add_case(tmp)
}

#confident
h1j <- broom.mixed::tidy(lmer(confident ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Confidence",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(confident ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Confidence",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1j <- h1j %>% 
    add_case(tmp)
}

#enthusiasm
h1k <- broom.mixed::tidy(lmer(enthusiasm ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Enthusiasm",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(enthusiasm ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Enthusiasm",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1k <- h1k %>% 
    add_case(tmp)
}

#Relief
h1l <- broom.mixed::tidy(lmer(relieved ~ factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 1",
         dv = "Relief",
         sample = "Pooled Analysis") %>% 
  select(term:sample) 

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(relieved ~ factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 1",
           dv = "Relief",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h1l <- h1l %>% 
    add_case(tmp)
}

h1 <- h1a %>% 
  add_case(h1b) %>% 
  add_case(h1c) %>% 
  add_case(h1d) %>% 
  add_case(h1e) %>% 
  add_case(h1f) %>% 
  add_case(h1g) %>% 
  add_case(h1h) %>% 
  add_case(h1i) %>% 
  add_case(h1j) %>% 
  add_case(h1k) %>% 
  add_case(h1l) %>% 
  filter(term %in% c("factor(smc)2", "factor(smc)3", "factor(smc)4")) %>% 
  mutate(term = recode(term,
                       `factor(smc)2` = "Social Media News Users",
                       `factor(smc)3` = "Traditional Media Users",
                       `factor(smc)4` = "News Avoiders"),
         upper = (estimate + (1.96*std.error)),
         lower = (estimate - (1.96*std.error)),
         sample = factor(sample,
                         levels = c("the Netherlands",
                                    "Sweden", "Spain",
                                    "Romania", "Portugal",
                                    "Poland", "Italy",
                                    "Hungary", "Germany",
                                    "France", "Denmark",
                                    "Belgium-Wallonia", "Belgium-Flanders",
                                    "Austria", "Pooled Analysis")),
         dv = factor(dv,
                     levels = c("Anger", "Anxiety", "Fear",
                                "Disgust", "Depression", "Sadness",
                                "Confidence","Enthusiasm", "Happiness", 
                                "Hope", "Pride", "Relief"))) %>% 
  ggplot(aes(x = estimate, y = sample,
             xmin = lower, xmax = upper,
             color = term)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "Effect of Sociale Media News Use on Political Sentiment \n \n Analyses are controled for demographic variables: gender, age, and education",
       y = "") +
  scale_color_manual(values = fig_cols) +
  #facet_grid(.~dv, scales = "free") +
  facet_wrap(vars(dv), ncol = 4, scales = "free") +
  theme(legend.position = "bottom") +
  guides(colour=guide_legend(title="Reference Category: News Junkies"))+
  geom_vline(xintercept = 0, linetype = "dashed", 
             linewidth = .7, color = "lightgray")

h1_2 <- h1a %>% 
  add_case(h1b) %>%
  filter(term %in% c("factor(smc)2", "factor(smc)3", "factor(smc)4")) %>% 
  mutate(term = recode(term,
                       `factor(smc)2` = "Social Media News Users",
                       `factor(smc)3` = "Traditional Media Users",
                       `factor(smc)4` = "News Avoiders"),
         upper = (estimate + (1.96*std.error)),
         lower = (estimate - (1.96*std.error)),
         sample = factor(sample,
                         levels = c("the Netherlands",
                                    "Sweden", "Spain",
                                    "Romania", "Portugal",
                                    "Poland", "Italy",
                                    "Hungary", "Germany",
                                    "France", "Denmark",
                                    "Belgium-Wallonia", "Belgium-Flanders",
                                    "Austria", "Pooled Analysis"))) %>% 
  ggplot(aes(x = estimate, y = sample,
             xmin = lower, xmax = upper,
             color = term)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "Effect of Sociale Media News Use on Political Sentiment \n \n Analyses are controled for demographic variables: gender, age, and education",
       y = "") +
  scale_color_manual(values = fig_cols) +
  facet_grid(.~dv, scales = "free") +
  #facet_wrap(vars(dv), ncol = 4, scales = "free") +
  theme(legend.position = "bottom") +
  guides(colour=guide_legend(title="Reference Category: News Junkies"))+
  geom_vline(xintercept = 0, linetype = "dashed", 
             linewidth = .7, color = "lightgray")
