countries <- unique(d1$country)

## Angst
h3a <- broom.mixed::tidy(lmer(vol_cs ~ anxiety * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Anxiety",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ anxiety * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Anxiety",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3a <- h3a %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ anxiety * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Anxiety",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3a <- h3a %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ anxiety * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Anxiety",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3a <- h3a %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ anxiety * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Anxiety",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3a <- h3a %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ anxiety * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Anxiety",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3a <- h3a %>% 
    add_case(tmp)
}

## Woede
h3b <- broom.mixed::tidy(lmer(vol_cs ~ anger * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Anger",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ anger * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Anger",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3b <- h3b %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ anger * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Anger",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3b <- h3b %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ anger * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Anger",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3b <- h3b %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ anger * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Anger",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3b <- h3b %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ anger * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Anger",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3b <- h3b %>% 
    add_case(tmp)
}

## Disgust
h3c <- broom.mixed::tidy(lmer(vol_cs ~ disgust * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Disgust",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ disgust * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Disgust",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3c <- h3c %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ disgust * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Disgust",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3c <- h3c %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ disgust * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Disgust",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3c <- h3c %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ disgust * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Disgust",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3c <- h3c %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ disgust * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Disgust",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3c <- h3c %>% 
    add_case(tmp)
}

## Fear
h3d <- broom.mixed::tidy(lmer(vol_cs ~ fear * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Fear",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ fear * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Fear",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3d <- h3d %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ fear * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Fear",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3d <- h3d %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ fear * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Fear",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3d <- h3d %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ fear * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Fear",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3d <- h3d %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ fear * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Fear",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3d <- h3d %>% 
    add_case(tmp)
}

## Sad
h3e <- broom.mixed::tidy(lmer(vol_cs ~ sad * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Sadness",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)


for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ sad * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Sadness",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3e <- h3e %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ sad * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Sadness",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3e <- h3e %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ sad * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Sadness",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3e <- h3e %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ sad * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Sadness",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3e <- h3e %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ sad * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Sadness",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3e <- h3e %>% 
    add_case(tmp)
}

## Depressed
h3f <- broom.mixed::tidy(lmer(vol_cs ~ depressed * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Depression",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ depressed * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Depression",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3f <- h3f %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ depressed * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Depression",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3f <- h3f %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ depressed * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Depression",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3f <- h3f %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ depressed * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Depression",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3f <- h3f %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ depressed * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Depression",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3f <- h3f %>% 
    add_case(tmp)
}

## Hope
h3g <- broom.mixed::tidy(lmer(vol_cs ~ hope * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Hope",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ hope * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Hope",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3g <- h3g %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ hope * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Hope",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3g <- h3g %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ hope * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Hope",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3g <- h3g %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ hope * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Hope",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3g <- h3g %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ hope * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Hope",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3g <- h3g %>% 
    add_case(tmp)
}

## Proud
h3h <- broom.mixed::tidy(lmer(vol_cs ~ proud * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Pride",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ proud * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Pride",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3h <- h3h %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ proud * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Pride",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3h <- h3h %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ proud * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Pride",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3h <- h3h %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ proud * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Pride",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3h <- h3h %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ proud * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Pride",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3h <- h3h %>% 
    add_case(tmp)
}

## Happy
h3i <- broom.mixed::tidy(lmer(vol_cs ~ happy * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Happiness",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ happy * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Happiness",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3i <- h3i %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ happy * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Happiness",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3i <- h3i %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ happy * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Happiness",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3i <- h3i %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ happy * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Happiness",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3i <- h3i %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ happy * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Happiness",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3i <- h3i %>% 
    add_case(tmp)
}

## confident
h3j <- broom.mixed::tidy(lmer(vol_cs ~ confident * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Confidence",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ confident * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Confidence",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3j <- h3j %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ confident * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Confidence",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3j <- h3j %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ confident * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Confidence",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3j <- h3j %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ confident * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Confidence",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3j <- h3j %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ confident * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Confidence",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3j <- h3j %>% 
    add_case(tmp)
}

## enthusiasm
h3k <- broom.mixed::tidy(lmer(vol_cs ~ enthusiasm * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Enthusiasm",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ enthusiasm * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Enthusiasm",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3k <- h3k %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ enthusiasm * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Enthusiasm",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3k <- h3k %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ enthusiasm * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Enthusiasm",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3k <- h3k %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ enthusiasm * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Enthusiasm",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3k <- h3k %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ enthusiasm * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Enthusiasm",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3k <- h3k %>% 
    add_case(tmp)
}

## relieved
h3l <- broom.mixed::tidy(lmer(vol_cs ~ relieved * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Relief",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ relieved * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Relief",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3l <- h3l %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ relieved * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Relief",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3l <- h3l %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ relieved * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Relief",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3l <- h3l %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ relieved * factor(smc) +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 3",
         emotion = "Relief",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h3l <- h3l %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ relieved * factor(smc) +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 3",
           emotion = "Relief",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h3l <- h3l %>% 
    add_case(tmp)
}

### Viz
h3 <- h3a %>% 
  add_case(h3b) %>% 
  add_case(h3c) %>% 
  add_case(h3d) %>% 
  add_case(h3e) %>% 
  add_case(h3f) %>% 
  add_case(h3g) %>% 
  add_case(h3h) %>% 
  add_case(h3i) %>% 
  add_case(h3j) %>% 
  add_case(h3k) %>% 
  add_case(h3l) %>% 
  filter(term %in% c("anger", "anxiety", "fear",
                     "disgust", "depressed", "sad",
                     "confident","enthusiasm", "happy", 
                     "hope", "proud", "relieved",
                     "factor(smc)2",
                     "anxiety:factor(smc)2",
                     "anger:factor(smc)2",
                     "fear:factor(smc)2",
                     "disgust:factor(smc)2",
                     "depressed:factor(smc)2",
                     "sad:factor(smc)2",
                     "confident:factor(smc)2",
                     "enthusiasm:factor(smc)2",
                     "happy:factor(smc)2",
                     "hope:factor(smc)2",
                     "proud:factor(smc)2",
                     "relieved:factor(smc)2")) %>% 
  mutate(upper = (estimate + (1.96*std.error)),
         lower = (estimate - (1.96*std.error)),
         term = recode(term,
                       `anger` = "Political Sentiment",
                       `anxiety` = "Political Sentiment",
                       `fear` = "Political Sentiment",
                       `disgust` = "Political Sentiment",
                       `depressed` = "Political Sentiment",
                       `sad` = "Political Sentiment",
                       `confident` = "Political Sentiment",
                       `enthusiasm` = "Political Sentiment",
                       `happy` = "Political Sentiment",
                       `hope` = "Political Sentiment",
                       `proud` = "Political Sentiment",
                       `relieved` = "Political Sentiment",
                       `factor(smc)2` = "Social Media News Users",
                       `anxiety:factor(smc)2` = "Interaction",
                       `fear:factor(smc)2` = "Interaction",
                       `anger:factor(smc)2` = "Interaction",
                       `disgust:factor(smc)2` = "Interaction",
                       `depressed:factor(smc)2` = "Interaction",
                       `sad:factor(smc)2` = "Interaction",
                       `confident:factor(smc)2` = "Interaction",
                       `enthusiasm:factor(smc)2` = "Interaction",
                       `happy:factor(smc)2` = "Interaction",
                       `hope:factor(smc)2` = "Interaction",
                       `proud:factor(smc)2` = "Interaction",
                       `relieved:factor(smc)2` = "Interaction"),
         sample = factor(sample,
                         levels = c("the Netherlands",
                                    "Sweden", "Spain",
                                    "Romania", "Portugal",
                                    "Poland", "Italy",
                                    "Hungary", "Germany",
                                    "France", "Denmark",
                                    "Belgium-Wallonia", "Belgium-Flanders",
                                    "Austria", "Pooled Analysis")),
         emotion = factor(emotion,
                          levels = c("Anger", "Anxiety", "Fear",
                                     "Disgust", "Depression", "Sadness",
                                     "Confidence","Enthusiasm", "Happiness", 
                                     "Hope", "Pride", "Relief"))) %>% 
  filter(term == "Interaction") %>% 
  ggplot(aes(x = estimate, y = sample,
             xmin = lower, xmax = upper,
             color = dv)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "Interaction Effect of Social Media News Use and Political Sentiment on Volatility \n \n Analyses are controled for demographic variables: gender, age, and education",
       y = "") +
  scale_color_manual(values = fig_cols) +
  facet_wrap(vars(emotion), ncol = 4, scales = "free") +
  #facet_grid(.~emotion, scales = "free") +
  theme(legend.position = "bottom",
        legend.title = element_blank()) +
  geom_vline(xintercept = 0, linetype = "dashed", linewidth = .7, color = "lightgray")

h3_1 <- h3a %>% 
  add_case(h3b) %>% 
  filter(term %in% c("anger", "anxiety",
                     "factor(smc)2", 
                     "anxiety:factor(smc)2",
                     "anger:factor(smc)2")) %>% 
  mutate(term = recode(term,
                       `anger` = "Political Sentiment",
                       `anxiety` = "Political Sentiment",
                       `factor(smc)2` = "Social Media News Users",
                       `anxiety:factor(smc)2` = "Interaction",
                       `anger:factor(smc)2` = "Interaction"),
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
  labs(x = "Interaction Effect of Social Media News Use and Political Sentiment on Volatility \n \n Analyses are controled for demographic variables: gender, age, and education",
       y = "") +
  scale_color_manual(values = fig_cols) +
  #facet_wrap(vars(emotion, sample), ncol = 4, scales = "free") +
  facet_grid(dv~emotion, scales = "free") +
  theme(legend.position = "bottom",
        legend.title = element_blank()) +
  geom_vline(xintercept = 0, linetype = "dashed", linewidth = .7, color = "lightgray")
