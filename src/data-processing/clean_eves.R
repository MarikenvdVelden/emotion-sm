## Variables of Interest (14 countries in 2018)
d1 <- read_sav(here("data/raw-private/EVES data combined all countries AN.sav")) 

#Austria 
au <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Austria") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1aAU,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24AU, #volatility measures
         ptv_p1 = Q22_1AU, #OVP
         ptv_p2 = Q22_2AU, #SPO
         ptv_p3 = Q22_3AU, #FPO
         ptv_p4 = Q22_4AU, #NEOS
         ptv_p5 = Q22_5AU, #PILZ
         ptv_p6 = Q22_6AU, #GRUENEN
         vote_choice = Q23AU,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedAU1a,
         region = Q5AU) %>% # Region  
  mutate(vote_choice = recode(vote_choice,
                              `1` = "OVP",
                              `7` = "Other",
                              `8` = "Didn't vote",
                              `9` = "Not eligible",
                              `10` = "Blanco",
                              `11` = "SPO",
                              `12` = "FPO",
                              `13` = "NEOS",
                              `14` = "Liste Pilz",
                              `15` = "Gruenen"),
         vote_intention = recode(vote_intention,
                                 `1` = "OVP",
                                 `8` = "Other",
                                 `12` = "Didn't vote",
                                 `13` = "Not eligible",
                                 `14` = "Blanco",
                                 `24` = "SPO",
                                 `25` = "FPO",
                                 `26` = "NEOS",
                                 `27` = "Liste Pilz",
                                 `28` = "Gruenen"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `19` = "Burgenland",
                         `28` = "Niederösterreich",
                         `29` = "Wien",
                         `30` = "Kärnten",
                         `31` = "Steiermark",
                         `32` = "Oberösterreich",
                         `33` = "Salzburg",
                         `34` = "Tirol",
                         `35` = "Vorarlberg",
                         `36` = "Outside country"))

#Belgium-Flanders 
fla <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Belgium-Flanders") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1aAU,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24FLA, #volatility measures
         ptv_p1 = Q22_1FLA, #NVA
         ptv_p2 = Q22_2FLA, #CD&V
         ptv_p3 = Q22_3FLA, #Open VLD
         ptv_p4 = Q22_4FLA, #SP.A
         ptv_p5 = Q22_5FLA, #GROEN
         ptv_p6 = Q22_6FLA, #VB
         ptv_p7 = Q22_7FLA, #LLD
         ptv_p8 = Q22_8FLA, #PS
         ptv_p9 = Q22_9FLA, #MR
         ptv_p10 = Q22_10FLA, #CHD
         ptv_p11 = Q22_11FLA, #ECOLO
         ptv_p12 = Q22_12FLA, #DeFI
         ptv_p13 = Q22_13FLA, #PP
         ptv_p14 = Q22_14FLA, #PTB-Pvd
         vote_choice = Q23FLA,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedfla1ab,
         region = Q5FLA) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "N-VA",
                              `2` = "CD&V",
                              `3` = "Open VLD",
                              `4` = "SP.A",
                              `5` = "GROEN",
                              `6` = "VB",
                              `7` = "LDD",
                              `8` = "PS",
                              `9` = "MR",
                              `10` = "CDH",
                              `11` = "ECOLO",
                              `12` = "DeFI",
                              `13` = "PP",
                              `14` = "PTB-PvdA",
                              `15` = "Other",
                              `16` = "Didn't vote",
                              `17` = "Not eligible",
                              `18` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "N-VA",
                                 `2` = "CD&V",
                                 `3` = "Open VLD",
                                 `4` = "SP.A",
                                 `5` = "GROEN",
                                 `6` = "VB",
                                 `7` = "LDD",
                                 `8` = "PS",
                                 `9` = "MR",
                                 `10` = "CDH",
                                 `11` = "ECOLO",
                                 `12` = "DeFI",
                                 `13` = "PP",
                                 `14` = "PTB-PvdA",
                                 `15` = "Other",
                                 `16` = "Didn't vote",
                                 `17` = "Not eligible",
                                 `18` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
        region = recode(region,
                         `2` = "Antwerpen",
                         `14` = "Limburg",
                         `15` = "Oost-Vlaanderen",
                         `16` = "Vlaams-Brabant",
                         `17` = "West-Vlaanderen",
                         `18` = "Waals-Brabant",
                         `19` = "Henegouwen",
                         `20` = "Luik",
                         `21` = "Luxemburg",
                         `22` = "Namen",
                         `23` = "Brussels",
                         `3` = "Outside country"))

#Belgium-Wallonia  
wal <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Belgium-Wallonia") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1a1bWAL,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24WAL, #volatility measures
         ptv_p1 = Q22_1WAL, #NVA
         ptv_p2 = Q22_2WAL, #CD&V
         ptv_p3 = Q22_3WAL, #Open VLD
         ptv_p4 = Q22_4WAL, #SP.A
         ptv_p5 = Q22_5WAL, #GROEN
         ptv_p6 = Q22_6WAL, #VB
         ptv_p7 = Q22_7WAL, #LLD
         ptv_p8 = Q22_8WAL, #PS
         ptv_p9 = Q22_9WAL, #MR
         ptv_p10 = Q22_10WAL, #CHD
         ptv_p11 = Q22_11WAL, #ECOLO
         ptv_p12 = Q22_12WAL, #DeFI
         ptv_p13 = Q22_13WAL, #PP
         ptv_p14 = Q22_14WAL, #PTB-Pvd
         vote_choice = Q23WAL,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedwal1ab,
         region = Q5WAL) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "N-VA",
                              `2` = "CD&V",
                              `3` = "Open VLD",
                              `4` = "SP.A",
                              `5` = "GROEN",
                              `6` = "VB",
                              `7` = "LDD",
                              `8` = "PS",
                              `9` = "MR",
                              `10` = "CDH",
                              `11` = "ECOLO",
                              `12` = "DeFI",
                              `13` = "PP",
                              `14` = "PTB-PvdA",
                              `15` = "Other",
                              `16` = "Didn't vote",
                              `17` = "Not eligible",
                              `18` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "N-VA",
                                 `2` = "CD&V",
                                 `3` = "Open VLD",
                                 `4` = "SP.A",
                                 `5` = "GROEN",
                                 `6` = "VB",
                                 `7` = "LDD",
                                 `8` = "PS",
                                 `9` = "MR",
                                 `10` = "CDH",
                                 `11` = "ECOLO",
                                 `12` = "DeFI",
                                 `13` = "PP",
                                 `14` = "PTB-PvdA",
                                 `15` = "Other",
                                 `16` = "Didn't vote",
                                 `17` = "Not eligible",
                                 `18` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `2` = "Antwerpen",
                         `14` = "Limburg",
                         `15` = "Oost-Vlaanderen",
                         `16` = "Vlaams-Brabant",
                         `17` = "West-Vlaanderen",
                         `18` = "Waals-Brabant",
                         `19` = "Henegouwen",
                         `20` = "Luik",
                         `21` = "Luxemburg",
                         `22` = "Namen",
                         `23` = "Brussels",
                         `3` = "Outside country"))

#Denmark 
dk <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Denmark") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1a_1bDK,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24DK, #volatility measures
         ptv_p1 = Q22_1DK, #Socialdemokratiet
         ptv_p2 = Q22_2DK, #Dansk Folkeparti
         ptv_p3 = Q22_3DK, #Venstre
         ptv_p4 = Q22_4DK, #Enhedslisten
         ptv_p5 = Q22_5DK, #Liberal Alliance
         ptv_p6 = Q22_6DK, #Alternativet
         ptv_p7 = Q22_7DK, #Radikale Venstre
         ptv_p8 = Q22_8DK, #Socialistisk Folkeparti
         ptv_p9 = Q22_9DK, #Det Konservative Folkepart
         ptv_p10 = Q22_10DK, #Nye Borgerlige
         vote_choice = Q23DK,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = isceddk1a,
         region = Q5DK) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "Socialdemokratiet",
                              `2` = "Dansk Folkeparti",
                              `3` = "Venstre",
                              `4` = "Enhedslisten",
                              `5` = "Liberal Alliance",
                              `6` = "Alternativet",
                              `7` = "Radikale Venstre",
                              `8` = "Socialistisk Folkeparti",
                              `9` = "Det Konservative Folkeparti",
                              `10` = "Other",
                              `11` = "Didn't vote",
                              `12` = "Not eligible",
                              `13` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "Socialdemokratiet",
                                 `2` = "Dansk Folkeparti",
                                 `3` = "Venstre",
                                 `4` = "Enhedslisten",
                                 `5` = "Liberal Alliance",
                                 `6` = "Alternativet",
                                 `7` = "Radikale Venstre",
                                 `8` = "Socialistisk Folkeparti",
                                 `9` = "Det Konservative Folkeparti",
                                 `10` = "Nye Borgerlige",
                                 `11` = "Other",
                                 `12` = "Didn't vote",
                                 `13` = "Not eligible",
                                 `14` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `1` = "Copenhagen",
                         `23` = "Midtjylland",
                         `24` = "Nordjylland",
                         `25` = "Sjælland",
                         `26` = "Syddanmark",
                         `2` = "Outside country"))
#France          
fr <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "France") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1aFR,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24FR, #volatility measures
         ptv_p1 = Q22_1FR, #France Insoumise
         ptv_p2 = Q22_2FR, #Parti communiste français
         ptv_p3 = Q22_3FR, #Europe Écologie Les Verts
         ptv_p4 = Q22_4FR, #Générations
         ptv_p5 = Q22_5FR, #Parti socialiste
         ptv_p6 = Q22_6FR, #Parti radical de gauche
         ptv_p7 = Q22_7FR, #La République en marche!
         ptv_p8 = Q22_8FR, #Mouvement démocrate
         ptv_p9 = Q22_9FR, #Union des démocrates et indépendants
         ptv_p10 = Q22_10FR, #Les Républicains
         ptv_p11 = Q22_11FR, #Debout la France
         ptv_p12 = Q22_12FR, #Front national
         vote_choice = Q23FR,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedFR1a,
         region = Q5FR) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "Alliance centriste",
                              `2` = "Debout la France",
                              `3` = "La République en marche!",
                              `4` = "Europe Écologie Les Verts",
                              `5` = "Front de gauche",
                              `6` = "Front national",
                              `7` = "Génération Citoyens",
                              `8` = "Le Rassemblement",
                              `9` = "Les Républicains",
                              `10` = "Mouvement démocrate",
                              `11` = "Parti Chrétien Démocrate",
                              `12` = "Parti communiste français",
                              `13` = "Parti communiste réunionnais",
                              `14` = "Parti de gauche",
                              `15` = "Parti radical",
                              `16` = "Parti radical de gauche",
                              `17` = "Parti socialiste",
                              `18` = "Souveraineté, indépendance et libertés",
                              `19` = "Union des démocrates et indépendants",
                              `20` = "Nouveau Parti Anticapitaliste",
                              `21` = "Lutte Ouvrièr",
                              `22` = "Mouvement Pour la France",
                              `23` = "Mouvement Républicain et Citoyen",
                              `24` = "France Insoumise",
                              `25` = "Union Populaire Républicaine",
                              `26` = "Other",
                              `27` = "Didn't vote",
                              `28` = "Not eligible",
                              `29` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "France Insoumise",
                                 `28` = "Parti communiste français",
                                 `29` = "Europe Écologie Les Verts",
                                 `30` = "Générations",
                                 `31` = "Parti socialiste",
                                 `32` = "Parti radical de gauche",
                                 `33` = "La République en marche!",
                                 `34` = "Mouvement démocrate",
                                 `35` = "Mouvement démocrate",
                                 `36` = "Les Républicainse",
                                 `37` = "Debout la France",
                                 `38` = "Front national",
                                 `24` = "Other",
                                 `25` = "Didn't vote",
                                 `26` = "Not eligible",
                                 `27` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `1` = "Auvergne-Rhône-Alpes",
                         `2` = "Bourgogne-France-Comté",
                         `3` = "Bretagne",
                         `4` = "Centre-Val de Loire",
                         `5` = "Corse",
                         `6` = "Grand Est",
                         `7` = "Hauts-de-France",
                         `8` = "Île-de-France",
                         `9` = "Normandie",
                         `10` = "Nouvelle-Aquitaine",
                         `11` = "Occitanie",
                         `12` = "Pays de la Loire",
                         `13` = "Provence-Alpes-Côte-d'Azur",
                         `14` = "Guadeloupe",
                         `15` = "Guyane",
                         `16` = "Martinique",
                         `17` = "La Réunion",
                         `18` = "Mayotte",
                         `19` = "Outside country"))

#Germany  
de <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Germany") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1aDE,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24DE, #volatility measures
         ptv_p1 = Q22_1DE, #CDU/CSU
         ptv_p2 = Q22_2DE, #SPD
         ptv_p3 = Q22_3DE, #AfD
         ptv_p4 = Q22_4DE, #Linke
         ptv_p5 = Q22_5DE, #FDP
         ptv_p6 = Q22_6DE, #Gruenen
         vote_choice = Q23DE,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedDE1a,
         region = Q5DE) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "CDU/CSU",
                              `2` = "SPD",
                              `3` = "AfD",
                              `4` = "Linke",
                              `5` = "FDP",
                              `6` = "Gruenen",
                              `7` = "Other",
                              `8` = "Didn't vote",
                              `9` = "Not eligible",
                              `10` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "CDU/CSU",
                                 `15` = "SPD",
                                 `16` = "AfD",
                                 `17` = "Linke",
                                 `18` = "FDP",
                                 `19` = "Gruenen",
                                 `8` = "Other",
                                 `12` = "Didn't vote",
                                 `13` = "Not eligible",
                                 `14` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `1` = "Baden Wurttemberg",
                         `2` = "Bayern",
                         `3` = "Berlin (West)",
                         `4` = "Berlin (Ost)",
                         `5` = "Brandenburg",
                         `6` = "Bremen",
                         `7` = "Hamburg",
                         `8` = "Hessen",
                         `9` = "Mecklenburg-Vorpommern",
                         `10` = "Niedersachsen",
                         `11` = "Nordrhein-Westfalen",
                         `12` = "Rheinland-Pfalz",
                         `13` = "Saarland",
                         `14` = "Sachsen",
                         `15` = "Sachsen-Anhalt",
                         `16` = "Schleswig-Holstein",
                         `17` = "Thüringen",
                         `18` = "Outside country"))

#Hungary            
hu <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Hungary") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1a1bHU,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24HU, #volatility measures
         ptv_p1 = Q22_1HU, #Fidesz
         ptv_p2 = Q22_2HU, #Jobbik
         ptv_p3 = Q22_3HU, #KDNP
         ptv_p4 = Q22_4HU, #MSZP
         ptv_p5 = Q22_5HU, #DK
         ptv_p6 = Q22_6HU, #LMP
         ptv_p7 = Q22_7HU, #Párbeszéd
         vote_choice = Q23HU,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedHU1a,
         region = Q5HU) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "Fidesz",
                              `2` = "Jobbik",
                              `3` = "KDNP",
                              `4` = "MSZP",
                              `5` = "DK",
                              `6` = "LMP",
                              `7` = "Párbeszéd",
                              `14` = "Other",
                              `15` = "Didn't vote",
                              `16` = "Not eligible",
                              `17` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "Fidesz",
                                 `28` = "Jobbik",
                                 `29` = "KDNP",
                                 `30` = "MSZP",
                                 `31` = "DK",
                                 `32` = "LMP",
                                 `33` = "Párbeszéd",
                                 `24` = "Other",
                                 `25` = "Didn't vote",
                                 `26` = "Not eligible",
                                 `27` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `2` = "Central Hungary",
                         `3` = "Central Transdanubia",
                         `4` = "West Transdanubia",
                         `5` = "South Transdanubia",
                         `6` = "North Hungary",
                         `7` = "Northern Great Plain",
                         `8` = "Southern Great Plain",
                         `20` = "Outside country"))

#Italy 
it <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Italy") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1aIT,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24IT, #volatility measures
         ptv_p1 = Q22_1IT, #Partito Democratico
         ptv_p2 = Q22_2IT, #+Europa
         ptv_p3 = Q22_3IT, #Insieme - Italia Europa
         ptv_p4 = Q22_4IT, #Civica Popolare
         ptv_p5 = Q22_5IT, #Forza Italia
         ptv_p6 = Q22_6IT, #Lega
         ptv_p7 = Q22_7IT, #Fratelli d'Italia
         ptv_p8 = Q22_8IT, #Noi con l'Italia UDC
         ptv_p9 = Q22_9IT, #Movimento 5 Stelle
         ptv_p10 = Q22_10IT, #Liberi e Uguali
         ptv_p11 = Q22_11IT, #Potere al Popolo!
         ptv_p12 = Q22_12IT, #CasaPound Italia
         vote_choice = Q23IT,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedIT1a,
         region = Q5IT) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "Partito Democratico",
                              `2` = "Sinistra Ecologia Libertà",
                              `3` = "Centro Democratico",
                              `4` = "Il Popolo della Libertà",
                              `5` = "Lega Nord",
                              `6` = "Fratelli d'Italia - CN",
                              `7` = "Movimento 5 Stelle",
                              `8` = "Scelta Civica",
                              `9` = "Unione di Centro",
                              `10` = "Other",
                              `11` = "Didn't vote",
                              `12` = "Not eligible",
                              `13` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `15` = "Partito Democratico",
                                 `16` = "Forza Italia",
                                 `18` = "Liberi e Uguali",
                                 `20` = "Noi con l'Italia UDC",
                                 `21` = "Potere al Popolo!",
                                 `22` = "Italia agli Italiani - FN - FT",
                                 `23` = "per una Sinistra Rivoluzionaria",
                                 `24` = "+Europa",
                                 `25` = "CasaPound Italia",
                                 `26` = "Insieme - Italia Europa",
                                 `27` = "Civica Popolare",
                                 `28` = "Partito Comunista",
                                 `29` = "Popolo della Famiglia",
                                 `17` = "Lega",
                                 `19` = "Fratelli d'Italia",
                                 `1` = "Movimento 5 Stelle",
                                 `8` = "Other",
                                 `12` = "Didn't vote",
                                 `13` = "Not eligible",
                                 `14` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `1` = "Piemonte",
                         `2` = "Basilicata",
                         `3` = "Calabria",
                         `4` = "Campania",
                         `5` = "Emilia-Romagna",
                         `6` = "Friuli-Venezia Giulia",
                         `7` = "Lazio",
                         `8` = "Liguria",
                         `9` = "Lombardia",
                         `10` = "Marche",
                         `11` = "Molise",
                         `12` = "Piemonte",
                         `13` = "Provincia Autonoma Di Bolzano/Bozen",
                         `14` = "Provincia Autonoma Di Trento",
                         `15` = "Puglia",
                         `16` = "Sardegna",
                         `17` = "Sicilia",
                         `18` = "Toscana",
                         `19` = "Umbria",
                         `20` = "Valle D'Aosta/Vallée D'Aoste",
                         `21` = "Veneto",
                         `22` = "Outside country"))

#Poland   
pl <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Poland") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1aPL,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24PL, #volatility measures
         ptv_p1 = Q22_1PL, #PiS
         ptv_p2 = Q22_2PL, #Platforma Obywatelska
         ptv_p3 = Q22_3PL, #Nowoczesna
         ptv_p4 = Q22_4PL, #Polskie Stronnictwo Ludowe (PSL)
         ptv_p5 = Q22_5PL, #Porozumienie 
         ptv_p6 = Q22_6PL, #Solidarna Polska (SP)
         ptv_p7 = Q22_7PL, #Wolni i Solidarni (WiS)
         ptv_p8 = Q22_8PL, #Unia Europejskich Demokratów (UED)
         ptv_p9 = Q22_9PL, #Unia Polityki Realnej (UPR)
         ptv_p10 = Q22_10PL, #KORWiN/Wolno??
         ptv_p11 = Q22_11PL, #Prawica Rzeczypospolitej
         ptv_p12 = Q22_12PL, #Kongres Nowej Prawicy (KNP)
         ptv_p13 = Q22_13PL, #Kukiz'15
         ptv_p14 = Q22_14PL, #Partia Razem
         ptv_p15 = Q22_15PL, #Sojusz Lewicy Demokratycznej
         vote_choice = Q23PL,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedPL1a,
         region = Q5PL) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "PiS",
                              `2` = "Platforma Obywatelska",
                              `3` = "Kukiz'15",
                              `4` = "Nowoczesna",
                              `5` = "Polskie Stronnictwo Ludowe",
                              `6` = "Zjednoczona Lewica",
                              `7` = "Polskie Stronnictwo Ludowe",
                              `8` = "KORWiN",
                              `9` = "Partia Razem",
                              `10` = "Other",
                              `11` = "Didn't vote",
                              `12` = "Not eligible",
                              `13` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "PiS",
                                 `28` = "Platforma Obywatelska",
                                 `3` = "Kukiz'15",
                                 `29` = "Nowoczesna",
                                 `30` = "Polskie Stronnictwo Ludowe",
                                 `31` = "Porozumienie",
                                 `32` = "Solidarna Polska (SP)",
                                 `33` = "Wolni i Solidarni (WiS)",
                                 `34` = "Unia Europejskich Demokratów (UED)",
                                 `35` = "Unia Polityki Realnej (UPR)",
                                 `36` = "Wolno?",
                                 `37` = "Prawica Rzeczypospolitej",
                                 `38` = "Kongres Nowej Prawicy (KNP)",
                                 `39` = "Kukiz'15",
                                 `40` = "Partia Razem",
                                 `41` = "Sojusz Lewicy Demokratycznej (SLD)",
                                 `24` = "Other",
                                 `25` = "Didn't vote",
                                 `26` = "Not eligible",
                                 `27` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `1` = "Lower Silesia",
                         `2` = "Kujawsko-Pomorskie",
                         `3` = "Lódzkie",
                         `4` = "Lubelskie",
                         `5` = "Lubuskie",
                         `6` = "Ma?opolskie",
                         `7` = "Mazowieckie",
                         `8` = "Opolskie",
                         `9` = "Podkarpackie",
                         `10` = "Podlaskie",
                         `11` = "?l?skie",
                         `12` = "?wi?tokrzyskie",
                         `13` = "Warmi?sko-Mazurskie",
                         `14` = "Wielkopolskie",
                         `15` = "Zachodniopomorskie",
                         `17` = "Pomorskie",
                         `16` = "Outside country"))

#Portugal    
pt <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Portugal") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1aPT,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24PT, #volatility measures
         ptv_p1 = Q22_1PT, #Bloco de Esquerda
         ptv_p2 = Q22_2PT, #CDS-PP
         ptv_p3 = Q22_3PT, #CDU
         ptv_p4 = Q22_4PT, #Partido Ecologista - Os Verdes
         ptv_p5 = Q22_5PT, #PCP 
         ptv_p6 = Q22_6PT, #PPD-PSD
         ptv_p7 = Q22_7PT, #PS
         ptv_p8 = Q22_8PT, #Pessoas-Animais-Natureza (PAN)
         vote_choice = Q23PT,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedPT1a,
         region = Q5PT) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "Bloco de Esquerda",
                              `2` = "CDS-PP",
                              `3` = "CDU",
                              `4` = "Partido Ecologista - Os Verdes",
                              `5` = "PCP",
                              `6` = "PPD-PSD",
                              `7` = "PS",
                              `8` = "Pessoas-Animais-Natureza (PAN)",
                              `9` = "Other",
                              `10` = "Didn't vote",
                              `11` = "Not eligible",
                              `12` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "Bloco de Esquerda",
                                 `28` = "CDS-PP",
                                 `29` = "CDU",
                                 `30` = "Partido Ecologista - Os Verdes",
                                 `31` = "PCP",
                                 `32` = "PPD-PSD",
                                 `33` = "PS",
                                 `34` = "Pessoas-Animais-Natureza (PAN)",
                                 `24` = "Other",
                                 `25` = "Didn't vote",
                                 `26` = "Not eligible",
                                 `27` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `1` = "Norte",
                         `2` = "Algarve",
                         `3` = "Centro/ Beiras",
                         `4` = "Área Metropolitana de Lisboa",
                         `5` = "Alentejo",
                         `6` = "Região Autónoma dos Açores",
                         `7` = "Região Autónoma da Madeira",
                         `8` = "Outside country"))

#Romania  
ro <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Romania") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country,
         weigths = weight1aRO,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24RO, #volatility measures
         ptv_p1 = Q22_1RO, #PSD
         ptv_p2 = Q22_2RO, #PNL
         ptv_p3 = Q22_3RO, #UDMR
         ptv_p4 = Q22_4RO, #PMP
         ptv_p5 = Q22_5RO, #USR 
         ptv_p6 = Q22_6RO, #ALDE
         vote_choice = Q23RO,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedRO1a,
         region = Q5RO) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "PSD",
                              `2` = "PNL",
                              `3` = "UDMR",
                              `4` = "PMP",
                              `5` = "USR",
                              `6` = "ALDE",
                              `7` = "Other",
                              `8` = "Didn't vote",
                              `9` = "Not eligible",
                              `10` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "PSD",
                                 `28` = "PNL",
                                 `29` = "UDMR",
                                 `30` = "PMP",
                                 `31` = "USR",
                                 `32` = "ALDE",
                                 `24` = "Other",
                                 `25` = "Didn't vote",
                                 `26` = "Not eligible",
                                 `27` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `1` = "Bihor",
                         `2` = "Arad",
                         `3` = "Timis",
                         `4` = "Caras-Severin",
                         `5` = "Mehedinti",
                         `6` = "Hunedoara",
                         `7` = "Cluj",
                         `8` = "Salaj",
                         `9` = "Satu-Mare",
                         `10` = "Maramures",
                         `11` = "Bistrita-Nasaud ",
                         `12` = "Mehedinti",
                         `13` = "Botosani",
                         `14` = "Neamt",
                         `15` = "Iaso",
                         `16` = "Mures",
                         `17` = "Vaslui",
                         `18` = "Harghita",
                         `19` = "Brasov",
                         `20` = "Bacau",
                         `21` = "Alba",
                         `22` = "Covasna",
                         `23` = "Sibiu",
                         `24` = "Vrancea",
                         `25` = "Galati",
                         `26` = "Valcea",
                         `27` = "Dambovita",
                         `28` = "Buzau",
                         `29` = "Braila",
                         `30` = "Tulcea",
                         `31` = "Gorj",
                         `32` = "Dolj",
                         `33` = "Olt",
                         `34` = "Arges",
                         `35` = "Teleorman",
                         `36` = "Prahova",
                         `37` = "Ilfov",
                         `38` = "Ialomita",
                         `39` = "Calarasi",
                         `40` = "Giurgiu",
                         `41` = "Constanta",
                         `42` = "Bucuresti",
                         `43` = "Outside country"))

#Spain 
es <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Spain") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country, 
         weigths = weightES,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24ES, #volatility measures
         ptv_p1 = Q22_1ES, #PP
         ptv_p2 = Q22_2ES, #PSOE
         ptv_p3 = Q22_3ES, #Unidos Podemos
         ptv_p4 = Q22_4ES, #Ciudadanos 
         ptv_p5 = Q22_5ES, #Esquerra Republicana de Catalunya 
         ptv_p6 = Q22_6ES, #Partido Nacionalista Vasco
         ptv_p7 = Q22_7ES, #Partit Demòcrata Europeu Català
         ptv_p8 = Q22_8ES, #Compromís
         ptv_p9 = Q22_9ES, #EH Bildu
         ptv_p10 = Q22_10ES, #Unión del Pueblo Navarro
         ptv_p11 = Q22_11ES, #Coalición Canaria 
         ptv_p12 = Q22_12ES, #Foro de Ciudadanos / Foro Asturias
         ptv_p13 = Q22_13ES, #Nueva Canarias
         vote_choice = Q23ES,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedES1a,
         region = Q5ES) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "PP",
                              `2` = "PSOE",
                              `3` = "Unidos Podemos",
                              `4` = "Ciudadanos",
                              `5` = "Esquerra Republicana de Catalunya",
                              `6` = "Partido Nacionalista Vasco",
                              `7` = "Partit Demòcrata Europeu Català",
                              `8` = "Compromís",
                              `9` = "EH Bildu",
                              `10` = "Unión del Pueblo Navarro",
                              `11` = "Coalición Canaria",
                              `12` = "Foro de Ciudadanos / Foro Asturias",
                              `13` = "Nueva Canarias",
                              `14` = "Other",
                              `15` = "Didn't vote",
                              `16` = "Not eligible",
                              `17` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "PP",
                                 `28` = "PSOE",
                                 `29` = "Unidos Podemos",
                                 `30` = "Ciudadanos",
                                 `31` = "Esquerra Republicana de Catalunya",
                                 `32` = "Partido Nacionalista Vasco",
                                 `33` = "Partit Demòcrata Europeu Català",
                                 `34` = "Compromís",
                                 `35` = "EH Bildu",
                                 `36` = "Unión del Pueblo Navarro",
                                 `37` = "Coalición Canaria",
                                 `38` = "Foro de Ciudadanos / Foro Asturias",
                                 `39` = "Nueva Canarias",
                                 `24` = "Other",
                                 `25` = "Didn't vote",
                                 `26` = "Not eligible",
                                 `27` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `1` = "Galicia",
                         `2` = "Principado De Asturias",
                         `3` = "Cantabria",
                         `4` = "País Vasco",
                         `5` = "Comunidad Foral De Navarra",
                         `6` = "La Rioja",
                         `7` = "Aragón",
                         `8` = "Comunidad De Madrid",
                         `9` = "Castilla Y León",
                         `10` = "Castilla-La Mancha",
                         `11` = "Extremadura",
                         `12` = "Cataluña",
                         `13` = "Comunidad Valenciana",
                         `14` = "Illes Balears",
                         `15` = "Andalucia",
                         `16` = "Region De Murcia",
                         `17` = "Ceuta",
                         `18` = "Melilla",
                         `19` = "Canarias",
                         `20` = "Outside country"))

#Sweden  
sw <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "Sweden") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country, 
         weigths = weight1aSW,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24SW, #volatility measures
         ptv_p1 = Q22_1SW, #Vänsterpartiet
         ptv_p2 = Q22_2SW, #Socialdemokraterna
         ptv_p3 = Q22_3SW, #Centerpartiet
         ptv_p4 = Q22_4SW, #Liberalerna 
         ptv_p5 = Q22_5SW, #Moderaterna
         ptv_p6 = Q22_6SW, #Kristdemokraterna
         ptv_p7 = Q22_7SW, #Miljöpartiet
         ptv_p8 = Q22_8SW, #Sverigedemokraterna
         ptv_p9 = Q22_9SW, #Feministiskt Initiativ
         vote_choice = Q23SW,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedSW1a,
         region = Q5SW) %>% # Region
  mutate(vote_choice = recode(vote_choice,
                              `1` = "Vänsterpartiet",
                              `2` = "Socialdemokraterna",
                              `3` = "Centerpartiet",
                              `4` = "Liberalerna",
                              `5` = "Moderaterna",
                              `6` = "Kristdemokraterna",
                              `7` = "Miljöpartiet",
                              `8` = "Sverigedemokraterna",
                              `9` = "Other",
                              `10` = "Didn't vote",
                              `11` = "Not eligible",
                              `12` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "Vänsterpartiet",
                                 `28` = "Socialdemokraterna",
                                 `29` = "Centerpartiet",
                                 `30` = "Liberalerna",
                                 `31` = "Moderaterna",
                                 `32` = "Kristdemokraterna",
                                 `33` = "Miljöpartiet",
                                 `34` = "Sverigedemokraterna",
                                 `39` = "Feministiskt Initiativ",
                                 `24` = "Other",
                                 `25` = "Didn't vote",
                                 `26` = "Not eligible",
                                 `27` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `1` = "Stockholms lan",
                         `2` = "Uppsala lan",
                         `3` = "Södermanlands lan",
                         `4` = "Östergötlands lan",
                         `5` = "Örebro lan",
                         `6` = "Västmanlands lan",
                         `7` = "Jönköpings lan",
                         `8` = "Kronobergs lan",
                         `9` = "Kalmar lan",
                         `10` = "Gotlands lan",
                         `11` = "Blekinge lan",
                         `12` = "Skåne lan",
                         `13` = "Hallands lan",
                         `14` = "Västra Götalands lan",
                         `15` = "Värmlands lan",
                         `16` = "Dalarnas lan",
                         `17` = "Gävleborgs lan",
                         `18` = "Västernorrlands lan",
                         `19` = "Jämtlands lan",
                         `20` = "Västerbottens lan",
                         `21` = "Norrbottens lan",
                         `22` = "Outside country"))

#the Netherlands 
nl <- d1 %>% 
  zap_labels() %>% 
  filter(Country == "the Netherlands") %>% 
  filter(Finishedwave1a == 1) %>% 
  select(id = ResponseId,
         country = Country, 
         weigths = weightNL,
         anger = Q7_1, # Political Sentiment
         disgust = Q7_2,
         fear = Q7_3,
         anxiety = Q7_4,
         sad = Q7_5, 
         depressed = Q7_6,
         hope = Q7_7,
         proud = Q7_8,
         happy = Q7_9,
         confident = Q7_10,
         enthusiasm = Q7_11,
         relieved = Q7_12,
         vote_intention = Q24NL, #volatility measures
         ptv_p1 = Q22_1NL, #CDA
         ptv_p2 = Q22_2NL, #PvdA
         ptv_p3 = Q22_3NL, #SP
         ptv_p4 = Q22_4NL, #VVD 
         ptv_p5 = Q22_5NL, #PVV
         ptv_p6 = Q22_6NL, #GroenLinks
         ptv_p7 = Q22_7NL, #ChristenUnie
         ptv_p8 = Q22_8NL, #D66
         ptv_p9 = Q22_9NL, #PvdD
         ptv_p10 = Q22_10NL, #SGP
         ptv_p11 = Q22_11NL, #50PLUS
         ptv_p12 = Q22_12NL, #DENK
         ptv_p13 = Q22_13NL, #FvD
         vote_choice = Q23NL,
         media_tv = Q35_1, media_internet = Q35_2,# media usage
         media_newspapers = Q35_3, media_sm = Q35_4,
         age = Q3, sex = Q2, ## Controls
         education = iscedNL1a,
         region = Q5NL) %>% 
  mutate(vote_choice = recode(vote_choice,
                              `1` = "CDA",
                              `2` = "PvdA",
                              `3` = "SP",
                              `4` = "VVD",
                              `5` = "PVV",
                              `6` = "GroenLinks",
                              `7` = "ChristenUnie",
                              `8` = "D66",
                              `9` = "PvdD",
                              `10` = "SGP",
                              `11` = "50PLUS",
                              `12` = "DENK",
                              `13` = "FvD",
                              `14` = "Other",
                              `15` = "Didn't vote",
                              `16` = "Not eligible",
                              `17` = "Blanco"),
         vote_intention = recode(vote_intention,
                                 `1` = "CDA",
                                 `12` = "PvdA",
                                 `13` = "SP",
                                 `14` = "VVD",
                                 `15` = "PVV",
                                 `16` = "GroenLinks",
                                 `17` = "ChristenUnie",
                                 `18` = "D66",
                                 `19` = "PvdD",
                                 `20` = "SGP",
                                 `21` = "50PLUS",
                                 `22` = "DENK",
                                 `23` = "FvD",
                                 `24` = "Other",
                                 `25` = "Didn't vote",
                                 `26` = "Not eligible",
                                 `27` = "Blanco"),
         age = 2018 - age,
         sex = recode(sex,
                      `1` = 0, #Male
                      `2` = 1), #Female
         region = recode(region,
                         `1` = "Drenthe",
                         `2` = "Flevoland",
                         `3` = "Friesland",
                         `4` = "Gelderland",
                         `5` = "Groningen",
                         `6` = "Limburg",
                         `7` = "Noord-Brabant",
                         `8` = "Noord-Holland",
                         `9` = "Overijssel",
                         `10` = "Utrecht",
                         `11` = "Zeeland",
                         `12` = "Zuid-Holland",
                         `13` = "Outside country"))

d1 <- bind_rows(au, de)
d1 <- bind_rows(d1, dk)  
d1 <- bind_rows(d1, es)  
d1 <- bind_rows(d1, fla)  
d1 <- bind_rows(d1, fr)  
d1 <- bind_rows(d1, hu)  
d1 <- bind_rows(d1, it)  
d1 <- bind_rows(d1, nl)  
d1 <- bind_rows(d1, pl)  
d1 <- bind_rows(d1, pt)  
d1 <- bind_rows(d1, ro)
d1 <- bind_rows(d1, sw)  
d1 <- bind_rows(d1, wal)  

d1 <- d1 %>% 
  select(id:ptv_p6, ptv_p7:ptv_p15,vote_choice:region)

rm(au, de, dk, es, fla, fr, hu, it, nl,
   pl, pt, ro, sw, wal)

#nl$ptv_p1 %>% attr(which = "label")
#nl %>% surveytoolbox::extract_vallab("vote_choice")
#df %>% .[,81:100] %>% surveytoolbox::varl_tb()
