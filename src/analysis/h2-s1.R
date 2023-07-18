countries <- unique(d1$country)

## Angst
h2a <- broom.mixed::tidy(lmer(vol_cs ~ anxiety +
                         age + factor(sex) +
                         factor(education) +
                         (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Anxiety",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ anxiety +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Anxiety",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2a <- h2a %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ anxiety +
                         age + factor(sex) +
                         factor(education) +
                         (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Anxiety",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2a <- h2a %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ anxiety +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Anxiety",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2a <- h2a %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ anxiety +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Anxiety",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2a <- h2a %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ anxiety +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Anxiety",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2a <- h2a %>% 
    add_case(tmp)
}

## Woede
h2b <- broom.mixed::tidy(lmer(vol_cs ~ anger +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Anger",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ anger +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Anger",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2b <- h2b %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ anger +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Anger",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2b <- h2b %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ anger +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Anger",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2b <- h2b %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ anger +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Anger",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2b <- h2b %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ anger +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Anger",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2b <- h2b %>% 
    add_case(tmp)
}

## Disgust
h2c <- broom.mixed::tidy(lmer(vol_cs ~ disgust +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Disgust",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ disgust +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Disgust",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2c <- h2c %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ disgust +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Disgust",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2c <- h2c %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ disgust +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Disgust",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2c <- h2c %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ disgust +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Disgust",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2c <- h2c %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ disgust +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Disgust",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2c <- h2c %>% 
    add_case(tmp)
}

## Fear
h2d <- broom.mixed::tidy(lmer(vol_cs ~ fear +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Fear",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ fear +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Fear",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2d <- h2d %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ fear +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Fear",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2d <- h2d %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ fear +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Fear",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2d <- h2d %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ fear +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Fear",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2d <- h2d %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ fear +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Fear",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2d <- h2d %>% 
    add_case(tmp)
}

## Sad
h2e <- broom.mixed::tidy(lmer(vol_cs ~ sad +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Sadness",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)


for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ sad +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Sadness",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2e <- h2e %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ sad +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Sadness",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2e <- h2e %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ sad +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Sadness",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2e <- h2e %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ sad +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Sadness",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2e <- h2e %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ sad +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Sadness",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2e <- h2e %>% 
    add_case(tmp)
}

## Depressed
h2f <- broom.mixed::tidy(lmer(vol_cs ~ depressed +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Depression",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ depressed +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Depression",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2f <- h2f %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ depressed +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Depression",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2f <- h2f %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ depressed +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Depression",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2f <- h2f %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ depressed +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Depression",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2f <- h2f %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ depressed +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Depression",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2f <- h2f %>% 
    add_case(tmp)
}

## Hope
h2g <- broom.mixed::tidy(lmer(vol_cs ~ hope +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Hope",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ hope +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Hope",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2g <- h2g %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ hope +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Hope",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2g <- h2g %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ hope +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Hope",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2g <- h2g %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ hope +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Hope",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2g <- h2g %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ hope +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Hope",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2g <- h2g %>% 
    add_case(tmp)
}

## Proud
h2h <- broom.mixed::tidy(lmer(vol_cs ~ proud +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Pride",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ proud +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Pride",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2h <- h2h %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ proud +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Pride",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2h <- h2h %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ proud +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Pride",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2h <- h2h %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ proud +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Pride",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2h <- h2h %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ proud +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Pride",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2h <- h2h %>% 
    add_case(tmp)
}

## Happy
h2i <- broom.mixed::tidy(lmer(vol_cs ~ happy +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Happiness",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ happy +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Happiness",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2i <- h2i %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ happy +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Happiness",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2i <- h2i %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ happy +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Happiness",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2i <- h2i %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ happy +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Happiness",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2i <- h2i %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ happy +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Happiness",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2i <- h2i %>% 
    add_case(tmp)
}

## confident
h2j <- broom.mixed::tidy(lmer(vol_cs ~ confident +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Confidence",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ confident +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Confidence",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2j <- h2j %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ confident +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Confidence",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2j <- h2j %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ confident +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Confidence",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2j <- h2j %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ confident +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Confidence",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2j <- h2j %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ confident +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Confidence",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2j <- h2j %>% 
    add_case(tmp)
}

## enthusiasm
h2k <- broom.mixed::tidy(lmer(vol_cs ~ enthusiasm +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Enthusiasm",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ enthusiasm +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Enthusiasm",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2k <- h2k %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ enthusiasm +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Enthusiasm",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2k <- h2k %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ enthusiasm +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Enthusiasm",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2k <- h2k %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ enthusiasm +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Enthusiasm",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2k <- h2k %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ enthusiasm +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Enthusiasm",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2k <- h2k %>% 
    add_case(tmp)
}

## relieved
h2l <- broom.mixed::tidy(lmer(vol_cs ~ relieved +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Relief",
         dv = "Choice-Set",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_cs ~ relieved +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Relief",
           dv = "Choice-Set",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2l <- h2l %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_intra ~ relieved +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Relief",
         dv = "Intra-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2l <- h2l %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_intra ~ relieved +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Relief",
           dv = "Intra-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2l <- h2l %>% 
    add_case(tmp)
}

tmp <- broom.mixed::tidy(lmer(vol_inter ~ relieved +
                                age + factor(sex) +
                                factor(education) +
                                (1 | country), data= d1)) %>% 
  mutate(hyp = "Comparative Study - Hypothesis 2",
         emotion = "Relief",
         dv = "Inter-Block",
         sample = "Pooled Analysis") %>% 
  select(term:sample)

h2l <- h2l %>% 
  add_case(tmp)

for(i in 1:length(countries)){
  df <- d1 %>% filter(country==countries[i])
  tmp <- broom::tidy(lm(vol_inter ~ relieved +
                          age + factor(sex) +
                          factor(education), df)) %>% 
    mutate(hyp = "Comparative Study - Hypothesis 2",
           emotion = "Relief",
           dv = "Inter-Block",
           sample = countries[i]) %>% 
    select(-p.value)
  
  h2l <- h2l %>% 
    add_case(tmp)
}

### Viz
h2 <- h2a %>% 
  add_case(h2b) %>% 
  add_case(h2c) %>% 
  add_case(h2d) %>% 
  add_case(h2e) %>% 
  add_case(h2f) %>% 
  add_case(h2g) %>% 
  add_case(h2h) %>% 
  add_case(h2i) %>% 
  add_case(h2j) %>% 
  add_case(h2k) %>% 
  add_case(h2l) %>% 
  filter(term %in% c("anger", "anxiety", "fear",
                     "disgust", "depressed", "sad",
                     "confident","enthusiasm", "happy", 
                     "hope", "proud", "relieved")) %>% 
  mutate(upper = (estimate + (1.96*std.error)),
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
         emotion = factor(emotion,
                     levels = c("Anger", "Anxiety", "Fear",
                                "Disgust", "Depression", "Sadness",
                                "Confidence","Enthusiasm", "Happiness", 
                                "Hope", "Pride", "Relief"))) %>% 
  ggplot(aes(x = estimate, y = sample,
             xmin = lower, xmax = upper,
             color = dv)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "Effect of Political Sentiment on Volatility \n \n Analyses are controled for demographic variables: gender, age, and education",
       y = "") +
  scale_color_manual(values = fig_cols) +
  facet_wrap(vars(emotion), ncol = 4, scales = "free") +
  #facet_grid(.~emotion, scales = "free") +
  theme(legend.position = "bottom",
        legend.title = element_blank()) +
  geom_vline(xintercept = 0, linetype = "dashed", linewidth = .7, color = "lightgray")

h2_1 <- h2a %>% 
  add_case(h2b) %>% 
  filter(term %in% c("anger", "anxiety")) %>% 
  mutate(upper = (estimate + (1.96*std.error)),
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
             color = dv)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "Effect of Political Sentiment on Volatility \n \n Analyses are controled for demographic variables: gender, age, and education",
       y = "") +
  scale_color_manual(values = fig_cols) +
  #facet_wrap(vars(emotion), ncol = 4, scales = "free") +
  facet_grid(.~emotion, scales = "free") +
  theme(legend.position = "bottom",
        legend.title = element_blank()) +
  geom_vline(xintercept = 0, linetype = "dashed", linewidth = .7, color = "lightgray")
