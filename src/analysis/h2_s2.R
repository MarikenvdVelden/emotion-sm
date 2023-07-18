dm <- df %>% 
  filter(wave!= "wave 5") %>% 
  mutate(smc = recode(smc, 
                      `2` = 1,
                      .default = 0),
         anxiety = as.factor(anxiety),
         aversion = as.factor(aversion),
         boredom = as.factor(boredom),
         distrust = as.factor(distrust),
         enthusiasm = as.factor(enthusiasm),
         hope = as.factor(hope),
         interest = as.factor(interest),
         respect = as.factor(respect)) %>% 
  select(anxiety:respect,
         smc, 
         conv_cs:cons_inter,
         age, sex, ethnicity,
         education, region, urbanisation, hours_sm, id, wave)

tmp <- df %>% 
  select(id, aversion:respect) %>% 
  group_by(id) %>% 
  summarise(aversion_tot = sum(aversion, na.rm = T),
            anxiety_tot = sum(anxiety, na.rm = T),
            boredom_tot = sum(boredom, na.rm = T),
            distrust_tot = sum(distrust, na.rm = T),
            enthusiasm_tot = sum(enthusiasm, na.rm = T),
            hope_tot = sum(hope, na.rm = T),
            interest_tot = sum(interest, na.rm = T),
            respect_tot = sum(respect, na.rm = T),
            n_id = n()) %>% 
  mutate(aversion_tot = round(aversion_tot/n_id,2),
         anxiety_tot = round(anxiety_tot/n_id,2),
         boredom_tot = round(boredom_tot/n_id,2),
         distrust_tot = round(distrust_tot/n_id,2),
         enthusiasm_tot = round(enthusiasm_tot/n_id,2),
         hope_tot = round(hope_tot/n_id,2),
         interest_tot = round(interest_tot/n_id,2),
         respect_tot = round(respect_tot/n_id,2)) %>% 
  select(id, aversion_tot:respect_tot)

dm <- left_join(dm, tmp, by = "id")

tmp <- df %>% 
  filter(wave == "wave 1") %>% 
  select(id, media_lit)

dm <- left_join(dm, tmp, by = "id")
dm <- dm %>% 
  mutate(media_lit = replace_na(media_lit, mean(media_lit, na.rm=T))) %>% 
  filter(wave == "wave 4")

## Angst
h2a <- broom::tidy(lm(conv_cs ~ anxiety_tot +
                 age + factor(sex) +
                 factor(ethnicity) +
                 factor(education) +
                 factor(region) +
                 factor(urbanisation) +
                 media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Anxiety",
         dv = "Conversion",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ anxiety_tot +
                 age + factor(sex) +
                 factor(ethnicity) +
                 factor(education) +
                 factor(region) +
                 factor(urbanisation) +
                 media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Anxiety",
         dv = "Conversion",
         id = "Intra-Block")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Anxiety",
         dv = "Conversion",
         id = "Inter-Block")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_cs ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Anxiety",
         dv = "Cristalization",
         id = "Choice-Set")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Anxiety",
         dv = "Cristalization",
         id = "Intra-Block")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Anxiety",
         dv = "Cristalization",
         id = "Inter-Block")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Anxiety",
         dv = "Consolidation",
         id = "Choice-Set")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Anxiety",
         dv = "Consolidation",
         id = "Intra-Block")

h2a <- h2a %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ anxiety_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Anxiety",
         dv = "Consolidation",
         id = "Inter-Block")

h2a <- h2a %>% 
  add_case(tmp)

## Aversion
h2b <- broom::tidy(lm(conv_cs ~ aversion_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Aversion",
         dv = "Conversion",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ aversion_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Aversion",
         dv = "Conversion",
         id = "Intra-Block")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ aversion_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Aversion",
         dv = "Conversion",
         id = "Inter-Block")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_cs ~ aversion_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Aversion",
         dv = "Cristalization",
         id = "Choice-Set")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ aversion_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Aversion",
         dv = "Cristalization",
         id = "Intra-Block")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ aversion_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Aversion",
         dv = "Cristalization",
         id = "Inter-Block")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ aversion_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Aversion",
         dv = "Consolidation",
         id = "Choice-Set")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ aversion_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Aversion",
         dv = "Consolidation",
         id = "Intra-Block")

h2b <- h2b %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ aversion_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Aversion",
         dv = "Consolidation", 
         id = "Inter-Block")

h2b <- h2b %>% 
  add_case(tmp)

## Boredom
h2c <- broom::tidy(lm(conv_cs ~ boredom_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Boredom",
         dv = "Conversion",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ boredom_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Boredom",
         dv = "Conversion",
         id = "Intra-Block")

h2c <- h2c %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ boredom_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Boredom",
         dv = "Conversion",
         id = "Inter-Block")

h2c <- h2c %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_cs ~ boredom_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Boredom",
         dv = "Cristalization",
         id = "Choice-Set")

h2c <- h2c %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ boredom_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Boredom",
         dv = "Cristalization",
         id = "Intra-Block")

h2c <- h2c %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ boredom_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Boredom",
         dv = "Cristalization",
         id = "Inter-Block")

h2c <- h2c %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ boredom_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Boredom",
         dv = "Consolidation",
         id = "Choice-Set")

h2c <- h2c %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ boredom_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Boredom",
         dv = "Consolidation",
         id = "Intra-Block")

h2c <- h2c %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ boredom_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Boredom",
         dv = "Consolidation",
         id = "Inter-Block")

h2c <- h2c %>% 
  add_case(tmp)

## Distrust
h2d <- broom::tidy(lm(conv_cs ~ distrust_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Distrust",
         dv = "Conversion",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ distrust_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Distrust",
         dv = "Conversion",
         id = "Intra-Block")

h2d <- h2d %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ distrust_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Distrust",
         dv = "Conversion",
         id = "Inter-Block")

h2d <- h2d %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_cs ~ distrust_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Distrust",
         dv = "Cristalization",
         id = "Choice-Set")

h2d <- h2d %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ distrust_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Distrust",
         dv = "Cristalization",
         id = "Intra-Block")

h2d <- h2d %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ distrust_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Distrust",
         dv = "Cristalization",
         id = "Inter-Block")

h2d <- h2d %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ distrust_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Distrust",
         dv = "Consolidation",
         id = "Choice-Set")

h2d <- h2d %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ distrust_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Distrust",
         dv = "Consolidation",
         id = "Intra-Block")

h2d <- h2d %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ distrust_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Distrust",
         dv = "Consolidation", 
         id = "Inter-Block")

h2d <- h2d %>% 
  add_case(tmp)

## Enthusiasm
h2e <- broom::tidy(lm(conv_cs ~ enthusiasm_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - h2e",
         emotie = "Enthusiasm",
         dv = "Conversion",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ enthusiasm_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - h2e",
         emotie = "Enthusiasm",
         dv = "Conversion",
         id = "Intra-Block")

h2e <- h2e %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ enthusiasm_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - h2e",
         emotie = "Enthusiasm",
         dv = "Conversion",
         id = "Inter-Block")

h2e <- h2e %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_cs ~ enthusiasm_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - h2e",
         emotie = "Enthusiasm",
         dv = "Cristalization",
         id = "Choice-Set")

h2e <- h2e %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ enthusiasm_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - h2e",
         emotie = "Enthusiasm",
         dv = "Cristalization",
         id = "Intra-Block")

h2e <- h2e %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ enthusiasm_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - h2e",
         emotie = "Enthusiasm",
         dv = "Cristalization",
         id = "Inter-Block")

h2e <- h2e %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ enthusiasm_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - h2e",
         emotie = "Enthusiasm",
         dv = "Consolidation",
         id = "Choice-Set")

h2e <- h2e %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ enthusiasm_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - h2e",
         emotie = "Enthusiasm",
         dv = "Consolidation",
         id = "Intra-Block")

h2e <- h2e %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ enthusiasm_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - h2e",
         emotie = "Enthusiasm",
         dv = "Consolidation",
         id = "Inter-Block")

h2e <- h2e %>% 
  add_case(tmp)

## Hope
h2f <- broom::tidy(lm(conv_cs ~ hope_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - 2hf",
         emotie = "Hope",
         dv = "Conversion",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ hope_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - 2hf",
         emotie = "Hope",
         dv = "Conversion",
         id = "Intra-Block")

h2f <- h2f %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ hope_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - 2hf",
         emotie = "Hope",
         dv = "Conversion",
         id = "Inter-Block")

h2f <- h2f %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_cs ~ hope_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - 2hf",
         emotie = "Hope",
         dv = "Cristalization",
         id = "Choice-Set")

h2f <- h2f %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ hope_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - 2hf",
         emotie = "Hope",
         dv = "Cristalization",
         id = "Intra-Block")

h2f <- h2f %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ hope_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - 2hf",
         emotie = "Hope",
         dv = "Cristalization",
         id = "Inter-Block")

h2f <- h2f %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ hope_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - 2hf",
         emotie = "Hope",
         dv = "Consolidation",
         id = "Choice-Set")

h2f <- h2f %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ hope_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - 2hf",
         emotie = "Hope",
         dv = "Consolidation",
         id = "Intra-Block")

h2f <- h2f %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ hope_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - 2hf",
         emotie = "Hope",
         dv = "Consolidation", 
         id = "Inter-Block")

h2f <- h2f %>% 
  add_case(tmp)

## Respect
h2g <- broom::tidy(lm(conv_cs ~ respect_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Respect",
         dv = "Conversion",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ respect_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Respect",
         dv = "Conversion",
         id = "Intra-Block")

h2g <- h2g %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ respect_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Respect",
         dv = "Conversion",
         id = "Inter-Block")

h2g <- h2g %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_cs ~ respect_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Respect",
         dv = "Cristalization",
         id = "Choice-Set")

h2g <- h2g %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ respect_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Respect",
         dv = "Cristalization",
         id = "Intra-Block")

h2g <- h2g %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ respect_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Respect",
         dv = "Cristalization",
         id = "Inter-Block")

h2g <- h2g %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ respect_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Respect",
         dv = "Consolidation",
         id = "Choice-Set")

h2g <- h2g %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ respect_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Respect",
         dv = "Consolidation",
         id = "Intra-Block")

h2g <- h2g %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ respect_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2a",
         emotie = "Respect",
         dv = "Consolidation",
         id = "Inter-Block")

h2g <- h2g %>% 
  add_case(tmp)

## Interest
h2h <- broom::tidy(lm(conv_cs ~ interest_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Interest",
         dv = "Conversion",
         id = "Choice-Set")

tmp <- broom::tidy(lm(conv_intra ~ interest_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Interest",
         dv = "Conversion",
         id = "Intra-Block")

h2h <- h2h %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(conv_inter ~ interest_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Interest",
         dv = "Conversion",
         id = "Inter-Block")

h2h <- h2h %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_cs ~ interest_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Interest",
         dv = "Cristalization",
         id = "Choice-Set")

h2h <- h2h %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_intra ~ interest_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Interest",
         dv = "Cristalization",
         id = "Intra-Block")

h2h <- h2h %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cristal_inter ~ interest_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Interest",
         dv = "Cristalization",
         id = "Inter-Block")

h2h <- h2h %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_cs ~ interest_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Interest",
         dv = "Consolidation",
         id = "Choice-Set")

h2h <- h2h %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_intra ~ interest_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Interest",
         dv = "Consolidation",
         id = "Intra-Block")

h2h <- h2h %>% 
  add_case(tmp)

tmp <- broom::tidy(lm(cons_inter ~ interest_tot +
                        age + factor(sex) +
                        factor(ethnicity) +
                        factor(education) +
                        factor(region) +
                        factor(urbanisation) +
                        media_lit, dm)) %>% 
  mutate(hyp = "Dutch Study - H2b",
         emotie = "Interest",
         dv = "Consolidation", 
         id = "Inter-Block")

h2h <- h2h %>% 
  add_case(tmp)

## Viz
h2 <- h2a %>% 
  add_case(h2b) %>% 
  add_case(h2c) %>% 
  add_case(h2d) %>% 
  add_case(h2e) %>% 
  add_case(h2f) %>% 
  add_case(h2g) %>% 
  add_case(h2h) %>% 
  filter(term %in% c("anxiety_tot", "aversion_tot",
                     "boredom_tot", "distrust_tot",
                     "enthusiasm_tot", "hope_tot",
                     "interest_tot", "respect_tot")) %>% 
  mutate(upper = (estimate + (1.56*std.error)),
         lower = (estimate - (1.56*std.error))) %>% 
  ggplot(aes(x = estimate, y = dv,
             xmin = lower, xmax = upper,
             color = id)) +
  geom_point(position = position_dodge(.5)) +
  geom_errorbar(width = 0, position = position_dodge(.5)) +
  theme_ipsum() +
  labs(x = "Effect of Political Sentiment on Volatility \n \n Analyses are controled for demographic variables: \n gender, age, education, ethnicity, region and media literacy",
       y = " ") +
  scale_color_manual(values = fig_cols) +
  facet_wrap(vars(emotie), ncol = 4, scales = "free") +
  theme(legend.position = "bottom",
        legend.title = element_blank()) +
  geom_vline(xintercept = 0, linetype = "dashed", linewidth = .7, color = "lightgray")
