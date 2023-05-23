## Sociale Media Consumption (I1_5)
# 1. social media hoger dan gemiddeld & andere media hoger dan gemiddeld, (news junkies)
# 2. social media hoger dan gemiddeld & andere lager dan gemiddeld, (categorie waar we geintereerd in zijn)
# 3. social media lager dan gemiddeld (mediaan) & andere media hoger dan gemiddeld
# 4. social media lager dan gemiddeld (mediaan) & andere lager dan gemiddeld (news avoiders)
d <- d %>% 
  mutate_at(vars(starts_with("I1_")),
            funs(8 - .)) %>% 
  group_by(wave) %>% 
  mutate(other_media = (I1_1 + I1_2 + I1_3 + I1_4 + I1_7)/5, #tel gebruik van andere media op
         m_om = mean(other_media, na.rm=T),#gemiddelde SM gebruik
         m_sm = mean(I1_5, na.rm=T)) %>%  #gemiddelde andere media gebruik
  rowwise() %>% 
  mutate(smc = NA, #definieeer de vier groepen
         smc = ifelse(I1_5 > m_sm & other_media > m_om, 1, smc),
         smc = ifelse(I1_5 > m_sm & other_media < m_om, 2, smc),
         smc = ifelse(I1_5 < m_sm & other_media > m_om, 3, smc),
         smc = ifelse(I1_5 < m_sm & other_media < m_om, 4, smc)) %>% 
  ungroup()

## Emoties
# 1. Angst (0/1)
# 2. Woede = of Afschuw of Wantrouwen (0/1)
d <- d %>% 
  mutate(anger = recode(H4,
                        `Distrust` = 1,
                        `Aversion` = 1,
                        .default = 0),
         anxiety = recode(H4,
                          `Distrust` = 1,
                          .default = 0))

tmp <- d %>% 
  group_by(id) %>% 
  summarise(ang_tot = sum(anger),
            anx_tot = sum(anxiety),
            n_id = n()) %>% 
  mutate(anger_tot = round(ang_tot/n_id,2),
         anxiety_tot = round(anx_tot/n_id,2)) %>% 
  select(id, anger_tot, anxiety_tot)

d <- left_join(d, tmp, by = "id")
  

## Volatileit
# 1. Conversie-inter: verandering van stemintentie in w1-w4 (veranderen gedurende campage) tussen de "blokken" (sven definieert blokken)
# 2. Conversie-intra: verandering van stemintentie in w1-w4 (veranderen gedurende campage) binnen het "blok" (sven definieert blokken)
# 3. Conversie-choiceset: verandering van stemintentie in w1-w4 (veranderen gedurende campage) binnen de choice set obv PTV
# 4. Kristalisatie-inter: veranderen van laatste stemintentie tov stemkeuze (w5) tussen de "blokken" (sven definieert blokken)
# 5. Kristalisatie-intra: veranderen van laatste stemintentie tov stemkeuze (w5)  binnen het "blok" (sven definieert blokken)
# 6. Kristalisatie-choiceset: veranderen van laatste stemintentie tov stemkeuze (w5) binnen de choice set obv PTV
# 7. Versteviging-inter: verandering stemkeuze TK21 naar stemkeuze w5 tussen de "blokken" (sven definieert blokken)
# 8. Versteviging-intra: verandering stemkeuze TK21 naar stemkeuze w5 binnen het "blok" (sven definieert blokken)
# 9. Versteviging-choiceset: verandering stemkeuze TK21 naar stemkeuze w5 binnen de choice set obv PTV

vol <- d1 %>% 
  select(id, E1, vc_w1 = A2a)  %>% 
  mutate(block_w1 = recode(vc_w1, #definieeer blok
                        `50Plus` = "Right-Conservative",
                        `BBB` = "Right-Conservative",
                        `BVNL` = "Right-Conservative",
                        `CDA` = "Right-Conservative",
                        `D66` = "Left-Progressive",
                        `PvdD` = "Left-Progressive", 
                        `GroenLinks` = "Left-Progressive", 
                        `SP` = "Left-Progressive", 
                        `ChristenUnie` = "Left-Progressive", 
                        `D66` = "Left-Progressive", 
                        `PvdA` = "Left-Progressive", 
                        `Piratenpartij` = "Left-Progressive", 
                        `Volt` = "Left-Progressive",
                        `Denk` = "Left-Progressive",
                        `FVD` = "Right-Conservative",
                        `JA21` = "Right-Conservative",
                        `Lid Omtzigt` = "Right-Conservative",
                        `PVV` = "Right-Conservative",
                        `SGP` = "Right-Conservative",
                        `VVD` = "Right-Conservative",
                        .default = "None"))
tmp <- d2 %>% 
  select(id, vc_w2 = A2a, A4_1:A4_16) %>% 
  mutate(block_w2 = recode(vc_w2, #definieeer blok
                                  `50Plus` = "Right-Conservative",
                                  `BBB` = "Right-Conservative",
                                  `BVNL` = "Right-Conservative",
                                  `CDA` = "Right-Conservative",
                                  `D66` = "Left-Progressive",
                                  `PvdD` = "Left-Progressive", 
                                  `GroenLinks` = "Left-Progressive", 
                                  `SP` = "Left-Progressive", 
                                  `ChristenUnie` = "Left-Progressive", 
                                  `D66` = "Left-Progressive", 
                                  `PvdA` = "Left-Progressive", 
                                  `Piratenpartij` = "Left-Progressive", 
                                  `Volt` = "Left-Progressive",
                                  `Denk` = "Left-Progressive",
                                  `FVD` = "Right-Conservative",
                                  `JA21` = "Right-Conservative",
                                  `Lid Omtzigt` = "Right-Conservative",
                                  `PVV` = "Right-Conservative",
                                  `SGP` = "Right-Conservative",
                                  `VVD` = "Right-Conservative",
                                  .default = "None"))

tst <- tmp %>% #definieeer choice sets
  select(id, A4_1:A4_16) %>% 
  pivot_longer(cols = A4_1:A4_16) %>% 
  filter(value > 6) %>% 
  mutate(name = recode(name,
                       `A4_1` = "VVD",
                       `A4_2` = "D66",
                       `A4_3` = "PVV",
                       `A4_4` = "CDA",
                       `A4_5` = "SP",
                       `A4_6` = "PvdA",
                       `A4_7` = "GL",
                       `A4_8` = "FvD",
                       `A4_9` = "PvdD",
                       `A4_10` = "CU",
                       `A4_11` = "JA21",
                       `A4_12` = "SGP",
                       `A4_13` = "Volt",
                       `A4_14` = "Denk",
                       `A4_15` = "BBB",
                       `A4_16` = "Bij1")) 
tst2 <- tst %>% 
  group_by(id) %>% 
  count() %>% 
  arrange(desc(n)) %>% filter(n<4) %>% 
  ungroup()

tst <- left_join(tst2, tst, by = "id")
tst <- tst %>% 
  select(id, name) %>% 
  pivot_wider(values_from = name) %>% 
  unite("choiceset", PVV:CDA, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"))

tmp <- inner_join(tmp, tst, by = "id") %>% 
  select(id, vc_w2, block_w2:c3)
vol <- inner_join(vol, tmp, by = "id")
tmp <- d3 %>% 
  select(id, vc_w3 = A2a)  %>% 
  mutate(block_w3 = recode(vc_w3,#definieeer blok
                           `50Plus` = "Right-Conservative",
                           `BBB` = "Right-Conservative",
                           `BVNL` = "Right-Conservative",
                           `CDA` = "Right-Conservative",
                           `D66` = "Left-Progressive",
                           `PvdD` = "Left-Progressive", 
                           `GroenLinks` = "Left-Progressive", 
                           `SP` = "Left-Progressive", 
                           `ChristenUnie` = "Left-Progressive", 
                           `D66` = "Left-Progressive", 
                           `PvdA` = "Left-Progressive", 
                           `Piratenpartij` = "Left-Progressive", 
                           `Volt` = "Left-Progressive",
                           `Denk` = "Left-Progressive",
                           `FVD` = "Right-Conservative",
                           `JA21` = "Right-Conservative",
                           `Lid Omtzigt` = "Right-Conservative",
                           `PVV` = "Right-Conservative",
                           `SGP` = "Right-Conservative",
                           `VVD` = "Right-Conservative",
                           .default = "None"))

vol <- inner_join(vol, tmp, by = "id")
tmp <- d4 %>% 
  select(id, vc_w4 = A2a)  %>% 
  mutate(block_w4 = recode(vc_w4,#definieeer blok
                           `50Plus` = "Right-Conservative",
                           `BBB` = "Right-Conservative",
                           `BVNL` = "Right-Conservative",
                           `CDA` = "Right-Conservative",
                           `D66` = "Left-Progressive",
                           `PvdD` = "Left-Progressive", 
                           `GroenLinks` = "Left-Progressive", 
                           `SP` = "Left-Progressive", 
                           `ChristenUnie` = "Left-Progressive", 
                           `D66` = "Left-Progressive", 
                           `PvdA` = "Left-Progressive", 
                           `Piratenpartij` = "Left-Progressive", 
                           `Volt` = "Left-Progressive",
                           `Denk` = "Left-Progressive",
                           `FVD` = "Right-Conservative",
                           `JA21` = "Right-Conservative",
                           `Lid Omtzigt` = "Right-Conservative",
                           `PVV` = "Right-Conservative",
                           `SGP` = "Right-Conservative",
                           `VVD` = "Right-Conservative",
                           .default = "None"))

vol <- inner_join(vol, tmp, by = "id") 
tmp <- d5 %>% #definieeer blok
  select(id, vc_w5 = A2a) %>% 
  mutate(block_w5 = recode(vc_w5,
                           `50Plus` = "Right-Conservative",
                           `BBB` = "Right-Conservative",
                           `BVNL` = "Right-Conservative",
                           `CDA` = "Right-Conservative",
                           `D66` = "Left-Progressive",
                           `PvdD` = "Left-Progressive", 
                           `GroenLinks` = "Left-Progressive", 
                           `SP` = "Left-Progressive", 
                           `ChristenUnie` = "Left-Progressive", 
                           `D66` = "Left-Progressive", 
                           `PvdA` = "Left-Progressive", 
                           `Piratenpartij` = "Left-Progressive", 
                           `Volt` = "Left-Progressive",
                           `Denk` = "Left-Progressive",
                           `FVD` = "Right-Conservative",
                           `JA21` = "Right-Conservative",
                           `Lid Omtzigt` = "Right-Conservative",
                           `PVV` = "Right-Conservative",
                           `SGP` = "Right-Conservative",
                           `VVD` = "Right-Conservative",
                           .default = "None"))
vol <- inner_join(vol, tmp, by = "id") 

vol <- left_join(n, vol, by = "id") %>% #definieeer type volatiliteit
  select(-n) %>% 
  mutate(conversion = ifelse(vc_w1 == vc_w2 &
                        vc_w2 == vc_w3 &
                        vc_w3 == vc_w4, 0, 1),
         conversion = ifelse(is.na(vc_w1) &
                        is.na(vc_w2) &
                        is.na(vc_w3) &
                        is.na(vc_w4), 0, conversion),
         cristal = ifelse(vc_w4 == vc_w5, 0, 1),
         cristal = ifelse(is.na(vc_w4) & is.na(vc_w5), 0, cristal),
         consolidation = ifelse(E1==vc_w5, 0, 1),
         consolidation = ifelse(is.na(E1) & is.na(vc_w5), 0, consolidation))

#voor ieder type volatiliteit, reken uit of het binnen choice-set, blok of tussen blok is
conv <- vol %>% 
  filter(conversion==1) %>% 
  select(id, vc_w1, vc_w2:vc_w4,
         block_w1:block_w4,
         c1:c3) %>% 
  mutate(tmp1 = ifelse(vc_w1 == c1 |
                            vc_w1 == c2 |
                            vc_w1 == c3, 0, 1),
         tmp1 = replace_na(tmp1, 0),
         tmp2 = ifelse(vc_w2 == c1 |
                         vc_w2 == c2 |
                         vc_w2 == c3, 0, 1),
         tmp2 = replace_na(tmp2, 0),
         tmp3 = ifelse(vc_w3 == c1 |
                         vc_w3 == c2 |
                         vc_w3 == c3, 0, 1),
         tmp3 = replace_na(tmp3, 0),
         tmp4 = ifelse(vc_w4 == c1 |
                         vc_w4 == c2 |
                         vc_w4 == c3, 0, 1),
         tmp4 = replace_na(tmp4, 0),
         conv_cs = (tmp1 + tmp2 + tmp3 + tmp4),
         conv_cs = recode(conv_cs, 
                          `0` = 1, .default = 0),
         conv_intra = ifelse(block_w1 == block_w2 &
           block_w2 == block_w3 &
           block_w3 == block_w4, 0, 1),
         conv_inter = ifelse(block_w1 != block_w2 |
                               block_w2 != block_w3 |
                               block_w3 != block_w4, 0, 1)) %>% 
  select(id, conv_cs, conv_intra, conv_inter)


tmp <- left_join(vol, conv, by = "id") %>% 
  mutate(conv_intra = replace_na(conv_intra, 0),
         conv_inter = replace_na(conv_inter, 0),
         conv_cs = replace_na(conv_intra, 0)) %>% 
  select(id, conv_cs:conv_inter)


cris <- vol %>% 
  filter(cristal==1) %>% 
  select(id, vc_w1, vc_w2:vc_w4,
         block_w1:block_w4,
         c1:c3) %>% 
  mutate(tmp1 = ifelse(vc_w1 == c1 |
                         vc_w1 == c2 |
                         vc_w1 == c3, 0, 1),
         tmp1 = replace_na(tmp1, 0),
         tmp2 = ifelse(vc_w2 == c1 |
                         vc_w2 == c2 |
                         vc_w2 == c3, 0, 1),
         tmp2 = replace_na(tmp2, 0),
         tmp3 = ifelse(vc_w3 == c1 |
                         vc_w3 == c2 |
                         vc_w3 == c3, 0, 1),
         tmp3 = replace_na(tmp3, 0),
         tmp4 = ifelse(vc_w4 == c1 |
                         vc_w4 == c2 |
                         vc_w4 == c3, 0, 1),
         tmp4 = replace_na(tmp4, 0),
         cristal_cs = (tmp1 + tmp2 + tmp3 + tmp4),
         cristal_cs = recode(cristal_cs, 
                          `0` = 1, .default = 0),
         cristal_intra = ifelse(block_w1 == block_w2 &
                               block_w2 == block_w3 &
                               block_w3 == block_w4, 0, 1),
         cristal_inter = ifelse(block_w1 != block_w2 |
                               block_w2 != block_w3 |
                               block_w3 != block_w4, 0, 1)) %>% 
  select(id, cristal_cs, cristal_intra, cristal_inter)

tmp2 <- left_join(vol, cris, by = "id") %>% 
  mutate(cristal_intra = replace_na(cristal_intra, 0),
         cristal_inter = replace_na(cristal_inter, 0),
         cristal_cs = replace_na(cristal_intra, 0)) %>% 
  select(id, cristal_cs:cristal_inter)

tmp <- inner_join(tmp, tmp2, by = "id")

cons <- vol %>% 
  filter(consolidation==1) %>% 
  select(id, vc_w1, vc_w2:vc_w4,
         block_w1:block_w4,
         c1:c3) %>% 
  mutate(tmp1 = ifelse(vc_w1 == c1 |
                         vc_w1 == c2 |
                         vc_w1 == c3, 0, 1),
         tmp1 = replace_na(tmp1, 0),
         tmp2 = ifelse(vc_w2 == c1 |
                         vc_w2 == c2 |
                         vc_w2 == c3, 0, 1),
         tmp2 = replace_na(tmp2, 0),
         tmp3 = ifelse(vc_w3 == c1 |
                         vc_w3 == c2 |
                         vc_w3 == c3, 0, 1),
         tmp3 = replace_na(tmp3, 0),
         tmp4 = ifelse(vc_w4 == c1 |
                         vc_w4 == c2 |
                         vc_w4 == c3, 0, 1),
         tmp4 = replace_na(tmp4, 0),
         cons_cs = (tmp1 + tmp2 + tmp3 + tmp4),
         cons_cs = recode(cons_cs, 
                             `0` = 1, .default = 0),
         cons_intra = ifelse(block_w1 == block_w2 &
                                  block_w2 == block_w3 &
                                  block_w3 == block_w4, 0, 1),
         cons_inter = ifelse(block_w1 != block_w2 |
                                  block_w2 != block_w3 |
                                  block_w3 != block_w4, 0, 1)) %>% 
  select(id, cons_cs, cons_intra, cons_inter)

tmp2 <- left_join(vol, cons, by = "id") %>% 
  mutate(cons_intra = replace_na(cons_intra, 0),
         cons_inter = replace_na(cons_inter, 0),
         cons_cs = replace_na(cons_intra, 0)) %>% 
  select(id, cons_cs:cons_inter)

tmp <- inner_join(tmp, tmp2, by = "id")

d <- left_join(d, tmp, by = "id")

## Selecteer Controls
# demografische variabelen
# 
# - Leeftijd
# - eductie
# - geslacht
# - ethniciteit
# - regio
# - urbanisatie
# 
# politieke achtergrond
# - Links-rechts (E2)
# - politieke kennis (D2)
# - media geletterdheid (I20)
# - populistisce attitues (F1)
# - politiek vertrouwen (F2)

df <- d %>% 
  mutate(pop_att = (F1_1 + F1_2 + F1_3 + F1_4 + F1_5)/5,#maak schalen
         trust = (F2_1 + F2_2 + F2_3 + F2_4 + F2_5 + F2_6 +
                    F2_7 + F2_8 + F2_9)/9,
         pol_know = (D2_1 + D2_2 + D2_3 + D2_4)/4,
         media_lit = (I20_1 + I20_2 + I20_3)/3) %>% 
  select(id, wave, weights, #survey info
         smc, sm = I1_5, other_media, #media concumption 
         anger, anxiety, #emotions
         anger_tot, anxiety_tot,
         conv_cs:cons_inter, #volatility
         age:urbanisation, #controls
         hours_sm = I22,
         ideology = E2, pop_att:media_lit)

rm(tmp, tmp2, tst, tst2, n, vol, conv, cris, cons,
   d1, d2, d3, d4, d5)
