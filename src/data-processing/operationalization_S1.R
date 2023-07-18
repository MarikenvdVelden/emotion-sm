## Sociale Media Consumption (I1_5)
# 1. social media hoger dan gemiddeld & andere media hoger dan gemiddeld, (news junkies)
# 2. social media hoger dan gemiddeld & andere lager dan gemiddeld, (categorie waar we geintereerd in zijn)
# 3. social media lager dan gemiddeld (mediaan) & andere media hoger dan gemiddeld
# 4. social media lager dan gemiddeld (mediaan) & andere lager dan gemiddeld (news avoiders)
d1 <- d1 %>% 
  group_by(country) %>% 
  mutate(other_media = (media_tv + media_internet + media_newspapers)/3, #tel gebruik van andere media op
         m_om = mean(other_media, na.rm=T),#gemiddelde SM gebruik
         m_sm = mean(media_sm, na.rm=T)) %>%  #gemiddelde andere media gebruik
  rowwise() %>% 
  mutate(smc = NA, #definieeer de vier groepen
         smc = ifelse(media_sm > m_sm & other_media > m_om, 1, smc),
         smc = ifelse(media_sm > m_sm & other_media < m_om, 2, smc),
         smc = ifelse(media_sm < m_sm & other_media > m_om, 3, smc),
         smc = ifelse(media_sm < m_sm & other_media < m_om, 4, smc)) %>% 
  ungroup()

## Emoties measured on 11 point scale
d1 <- d1 %>% 
  mutate(anger = anger - 1,
         disgust = disgust -1,
         fear = fear - 1,
         anxiety = anxiety - 1,
         sad = sad - 1,
         depressed = depressed - 1,
         hope = hope - 1,
         proud = proud - 1,
         happy = happy - 1,
         confident = confident - 1,
         enthusiasm = enthusiasm - 1,
         relieved = relieved - 1)

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
  select(id, vote_choice, vote_intention, rile_vc, rile_vi)  %>% 
  drop_na(vote_choice, vote_intention) %>% 
  mutate(block_vc = ifelse(rile_vc < 0, "Left-Progressive", "Right-Conservative"),
         block_vi = ifelse(rile_vi < 0, "Left-Progressive", "Right-Conservative"),
         block_change = ifelse(block_vc == block_vi, 0, 1),
         block_change = replace_na(block_change, 1),
         vol_intra = ifelse(vote_choice != vote_intention & block_change == 0, 1, 0),
         vol_inter = ifelse(vote_choice != vote_intention & block_change == 1, 1, 0))

tst <- d1 %>% #definieeer choice sets
  mutate(rile = rile_vc,
         rile = ifelse(is.na(rile), rile_vi[is.na(rile)], rile)) %>% 
  select(id, ptv_p1:ptv_p15, rile, country) %>% 
  pivot_longer(cols = ptv_p1:ptv_p15) %>% 
  filter(value > 6) 

tst2 <- tst %>% 
  group_by(id) %>% 
  count() %>% 
  arrange(desc(n)) %>% filter(n<4) %>% 
  ungroup()

tst <- left_join(tst2, tst, by = "id")
tst <- tst %>% 
  select(id, name, country) %>% 
  mutate(name = case_when(
    name == "ptv_p1" & country == "Austria" ~ "OVP",
    name == "ptv_p2" & country == "Austria" ~ "SPO",
    name == "ptv_p3" & country == "Austria" ~ "FPO",
    name == "ptv_p4" & country == "Austria" ~ "NEOS",
    name == "ptv_p5" & country == "Austria" ~ "Liste Pilz",
    name == "ptv_p6" & country == "Austria" ~ "Gruenen",
    name == "ptv_p1" & country == "Belgium-Flanders" ~ "N-VA",
    name == "ptv_p2" & country == "Belgium-Flanders" ~ "CD&V",
    name == "ptv_p3" & country == "Belgium-Flanders" ~ "Open VLD",
    name == "ptv_p5" & country == "Belgium-Flanders" ~ "SP.A",
    name == "ptv_p6" & country == "Belgium-Flanders" ~ "VB",
    name == "ptv_p7" & country == "Belgium-Flanders" ~ "LDD",
    name == "ptv_p8" & country == "Belgium-Flanders" ~ "PS",
    name == "ptv_p9" & country == "Belgium-Flanders" ~ "MR",
    name == "ptv_p10" & country == "Belgium-Flanders" ~ "CDH",
    name == "ptv_p11" & country == "Belgium-Flanders" ~ "ECOLO",
    name == "ptv_p12" & country == "Belgium-Flanders" ~ "DeFI",
    name == "ptv_p13" & country == "Belgium-Flanders" ~ "PP",
    name == "ptv_p14" & country == "Belgium-Flanders" ~ "PTB-PvdA",
    name == "ptv_p1" & country == "Belgium-Wallonia" ~ "N-VA",
    name == "ptv_p2" & country == "Belgium-Wallonia" ~ "CD&V",
    name == "ptv_p3" & country == "Belgium-Wallonia" ~ "Open VLD",
    name == "ptv_p5" & country == "Belgium-Wallonia" ~ "SP.A",
    name == "ptv_p6" & country == "Belgium-Wallonia" ~ "VB",
    name == "ptv_p7" & country == "Belgium-Wallonia" ~ "LDD",
    name == "ptv_p8" & country == "Belgium-Wallonia" ~ "PS",
    name == "ptv_p9" & country == "Belgium-Wallonia" ~ "MR",
    name == "ptv_p10" & country == "Belgium-Wallonia" ~ "CDH",
    name == "ptv_p11" & country == "Belgium-Wallonia" ~ "ECOLO",
    name == "ptv_p12" & country == "Belgium-Wallonia" ~ "DeFI",
    name == "ptv_p13" & country == "Belgium-Wallonia" ~ "PP",
    name == "ptv_p14" & country == "Belgium-Wallonia" ~ "PTB-PvdA",
    name == "ptv_p1" & country == "Denmark" ~ "Socialdemokratiet",
    name == "ptv_p2" & country == "Denmark" ~ "Dansk Folkeparti",
    name == "ptv_p3" & country == "Denmark" ~ "Venstre",
    name == "ptv_p4" & country == "Denmark" ~ "Enhedslisten",
    name == "ptv_p5" & country == "Denmark" ~ "Liberal Alliance",
    name == "ptv_p6" & country == "Denmark" ~ "Alternativet",
    name == "ptv_p7" & country == "Denmark" ~ "Radikale Venstre",
    name == "ptv_p8" & country == "Denmark" ~ "Socialistisk Folkeparti",
    name == "ptv_p9" & country == "Denmark" ~ "Det Konservative Folkeparti",
    name == "ptv_p10" & country == "Denmark" ~ "Nye Borgerlige",
    name == "ptv_p1" & country == "France" ~ "France Insoumise" ,
    name == "ptv_p2" & country == "France" ~ "Parti communiste français",
    name == "ptv_p3" & country == "France" ~ "Europe Écologie Les Verts",
    name == "ptv_p4" & country == "France" ~ "Générations",
    name == "ptv_p5" & country == "France" ~ "Parti socialiste",
    name == "ptv_p6" & country == "France" ~ "Parti radical de gauche",
    name == "ptv_p7" & country == "France" ~ "La République en marche!",
    name == "ptv_p8" & country == "France" ~ "Mouvement démocrate",
    name == "ptv_p9" & country == "France" ~ "Union des démocrates et indépendants",
    name == "ptv_p10" & country == "France" ~ "Les Républicainse",
    name == "ptv_p11" & country == "France" ~ "Debout la France",
    name == "ptv_p12" & country == "France" ~ "Front national",
    name == "ptv_p1" & country == "Germany" ~ "CDU/CSU",
    name == "ptv_p2" & country == "Germany" ~ "SPD",
    name == "ptv_p3" & country == "Germany" ~ "AfD",
    name == "ptv_p4" & country == "Germany" ~ "Linke",
    name == "ptv_p5" & country == "Germany" ~ "FDP",
    name == "ptv_p6" & country == "Germany" ~ "Gruenen",
    name == "ptv_p1" & country == "Hungary" ~ "Fidesz",
    name == "ptv_p2" & country == "Hungary" ~ "Jobbik",
    name == "ptv_p3" & country == "Hungary" ~ "KDNP",
    name == "ptv_p4" & country == "Hungary" ~ "MSZP",
    name == "ptv_p5" & country == "Hungary" ~ "DK",
    name == "ptv_p6" & country == "Hungary" ~ "LMP",
    name == "ptv_p7" & country == "Hungary" ~ "Párbeszéd",
    name == "ptv_p1" & country == "Italy" ~ "Partito Democratico",
    name == "ptv_p2" & country == "Italy" ~ "+Europa",
    name == "ptv_p3" & country == "Italy" ~ "Insieme - Italia Europa",
    name == "ptv_p4" & country == "Italy" ~ "Civica Popolare",
    name == "ptv_p5" & country == "Italy" ~ "Forza Italia",
    name == "ptv_p6" & country == "Italy" ~ "Lega",
    name == "ptv_p7" & country == "Italy" ~ "Fratelli d'Italia",
    name == "ptv_p8" & country == "Italy" ~ "Noi con l'Italia UDC",
    name == "ptv_p9" & country == "Italy" ~ "Movimento 5 Stelle",
    name == "ptv_p10" & country == "Italy" ~ "Liberi e Ugual",
    name == "ptv_p11" & country == "Italy" ~ "Potere al Popolo!",
    name == "ptv_p12" & country == "Italy" ~ "CasaPound Italia",
    name == "ptv_p1" & country == "Poland" ~ "PiS",
    name == "ptv_p2" & country == "Poland" ~ "Platforma Obywatelska",
    name == "ptv_p3" & country == "Poland" ~ "Nowoczesna",
    name == "ptv_p4" & country =="Poland" ~ "Polskie Stronnictwo Ludowe",
    name == "ptv_p5" & country == "Poland" ~ "Porozumienie",
    name == "ptv_p6" & country == "Poland" ~ "Solidarna Polska (SP)",
    name == "ptv_p7" & country == "Poland" ~ "Wolni i Solidarni (WiS)",
    name == "ptv_p8" & country == "Poland" ~ "Unia Europejskich Demokratów (UED)",
    name == "ptv_p9" & country == "Poland" ~ "Unia Polityki Realnej (UPR)",
    name == "ptv_p10" & country == "Poland" ~ "KORWiN",
    name == "ptv_p11" & country == "Poland" ~ "Prawica Rzeczypospolitej",
    name == "ptv_p12" & country == "Poland" ~ "Kongres Nowej Prawicy (KNP)",
    name == "ptv_p13" & country == "Poland" ~ "Kukiz'15",
    name == "ptv_p14" & country == "Poland" ~ "Partia Razem",
    name == "ptv_p15" & country == "Poland" ~ "Sojusz Lewicy Demokratycznej (SLD)",
    name == "ptv_p1" & country == "Portugal" ~ "Bloco de Esquerda",
    name == "ptv_p2" & country == "Portugal" ~ "CDS-PP",
    name == "ptv_p3" & country == "Portugal" ~ "CDU",
    name == "ptv_p4" & country == "Portugal" ~ "Partido Ecologista - Os Verdes",
    name == "ptv_p5" & country == "Portugal" ~ "PCP",
    name == "ptv_p6" & country == "Portugal" ~ "PPD-PS",
    name == "ptv_p7" & country == "Portugal" ~ "PS",
    name == "ptv_p8" & country == "Portugal" ~ "Pessoas-Animais-Natureza (PAN)",
    name == "ptv_p1" & country == "Romania" ~ "PSD",
    name == "ptv_p2" & country == "Romania" ~ "PNL",
    name == "ptv_p3" & country == "Romania" ~ "UDMR",
    name == "ptv_p4" & country == "Romania" ~ "PMP",
    name == "ptv_p5" & country == "Romania" ~ "USR",
    name == "ptv_p6" & country == "Romania" ~ "ALDE",
    name == "ptv_p1" & country == "Spain" ~ "PP",
    name == "ptv_p2" & country == "Spain" ~ "PSOE",
    name == "ptv_p3" & country == "Spain" ~ "Unidos Podemos",
    name == "ptv_p4" & country == "Spain" ~ "Ciudadanos",
    name == "ptv_p5" & country == "Spain" ~ "Esquerra Republicana de Catalunya",
    name == "ptv_p6" & country == "Spain" ~ "Partido Nacionalista Vasco",
    name == "ptv_p7" & country == "Spain" ~ "Partit Demòcrata Europeu Català",
    name == "ptv_p8" & country == "Spain" ~ "Compromís",
    name == "ptv_p9" & country == "Spain" ~ "EH Bildu",
    name == "ptv_p10" & country == "Spain" ~ "Unión del Pueblo Navarro",
    name == "ptv_p11" & country == "Spain" ~ "Coalición Canaria",
    name == "ptv_p12" & country == "Spain" ~ "Foro de Ciudadanos / Foro Asturias",
    name == "ptv_p13" & country == "Spain" ~ "Nueva Canarias",
    name == "ptv_p1" & country == "Sweden" ~ "Vänsterpartiet",
    name == "ptv_p2" & country == "Sweden" ~ "Socialdemokraterna",
    name == "ptv_p3" & country == "Sweden" ~ "Centerpartiet",
    name == "ptv_p4" & country == "Sweden" ~ "Liberalerna",
    name == "ptv_p5" & country == "Sweden" ~ "Moderaterna",
    name == "ptv_p6" & country == "Sweden" ~ "Kristdemokraterna",
    name == "ptv_p7" & country == "Sweden" ~ "Miljöpartiet",
    name == "ptv_p8" & country == "Sweden" ~ "Sverigedemokraterna",
    name == "ptv_p9" & country == "Sweden" ~ "Feministiskt Initiativ",
    name == "ptv_p1" & country == "the Netherlands" ~ "CDA",
    name == "ptv_p2" & country == "the Netherlands" ~ "PvdA",
    name == "ptv_p3" & country == "the Netherlands" ~ "SP",
    name == "ptv_p4" & country == "the Netherlands" ~ "VVD",
    name == "ptv_p5" & country == "the Netherlands" ~ "PVV",
    name == "ptv_p6" & country == "the Netherlands" ~ "GroenLinks",
    name == "ptv_p7" & country == "the Netherlands" ~ "ChristenUnie",
    name == "ptv_p8" & country == "the Netherlands" ~ "D66",
    name == "ptv_p9" & country == "the Netherlands" ~ "PvdD",
    name == "ptv_p10" & country == "the Netherlands" ~ "SGP",
    name == "ptv_p11" & country == "the Netherlands" ~ "50PLUS",
    name == "ptv_p12" & country == "the Netherlands" ~ "DENK",
    name == "ptv_p13" & country == "the Netherlands" ~ "FvD")) 

au <- tst %>% 
  filter(country == "Austria") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", SPO:FPO, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

fla <- tst %>% 
  filter(country == "Belgium-Flanders") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", `Open VLD`:`PTB-PvdA`, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

wal <- tst %>% 
  filter(country == "Belgium-Wallonia") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", `Open VLD`:`PTB-PvdA`, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

dk <- tst %>% 
  filter(country == "Denmark") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", Socialdemokratiet:Alternativet, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

fr <- tst %>% 
  filter(country == "France") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", `Parti socialiste`:`Parti communiste français`, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

de <- tst %>% 
  filter(country == "Germany") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", SPD:`CDU/CSU`, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

hu <- tst %>% 
  filter(country == "Hungary") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", MSZP:Jobbik, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

it <- tst %>% 
  filter(country == "Italy") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", Lega:`Noi con l'Italia UDC`, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

pl <- tst %>% 
  filter(country == "Poland") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", `Unia Polityki Realnej (UPR)`:Porozumienie, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

pt <- tst %>% 
  filter(country == "Portugal") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", `Bloco de Esquerda`:PCP, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

ro <- tst %>% 
  filter(country == "Romania") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", PSD:PNL, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

es <- tst %>% 
  filter(country == "Spain") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", `Unidos Podemos`:`Coalición Canaria`, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

sw <- tst %>% 
  filter(country == "Sweden") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", `Socialdemokraterna`:`Centerpartiet`, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

nl <- tst %>% 
  filter(country == "the Netherlands") %>%  
  pivot_wider(values_from = name) %>% 
  unite("choiceset", `SP`:`DENK`, na.rm = TRUE, remove = FALSE) %>% 
  select(id, choiceset) %>% 
  separate(choiceset, into=c("c1", "c2", "c3"), sep = "_") %>% 
  distinct(id, .keep_all = TRUE)

tst <- au %>% 
  add_case(fla) %>% 
  add_case(wal) %>% 
  add_case(dk) %>% 
  add_case(es) %>% 
  add_case(fr) %>% 
  add_case(hu) %>% 
  add_case(de) %>% 
  add_case(it) %>% 
  add_case(nl) %>% 
  add_case(pl) %>% 
  add_case(pt) %>% 
  add_case(sw) %>% 
  add_case(ro) 

rm(au, de, dk, es, fla, fr, hu, it, nl, pl, pt, ro, sw, wal, tst2)

tmp <- inner_join(vol, tst, by = "id")  

tmp <- tmp %>% 
  mutate(tmp1 = ifelse(vote_intention == c1 |
                         vote_intention == c2 |
                         vote_intention == c3, 0, 1),
         tmp1 = replace_na(tmp1, 0),
         tmp2 = ifelse(vote_choice == c1 |
                         vote_choice == c2 |
                         vote_choice == c3, 0, 1),
         tmp2 = replace_na(tmp2, 0),
         choice_set = (tmp1 + tmp2),
         vol_cs = case_when(
           choice_set == 0 ~ 0,
           choice_set == 1 ~ 1,
           choice_set == 2 ~ 0
         )) %>% 
  select(id, vol_intra, vol_inter, vol_cs)

d1 <- left_join(d1, tmp)

rm(tmp, tst, vol)
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

d1 <- d1 %>% 
  select(id:weigths, #survey info
         media_sm, other_media: smc, #media concumption 
         anger:relieved, #emotions
         vol_intra:vol_cs, #volatility
         age:region #controls
  )

