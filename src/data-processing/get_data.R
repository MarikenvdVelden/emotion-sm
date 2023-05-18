load(here("data/raw-private/cleaned_data_w1.RData")) 
d1 <- d1 %>% select(id:urbanisation, #demografische kenmerken
                    A2a, A2b, #stemintentie nationaal & lokaal
                    D2_1:D2_4, #bullshit reciptivity
                    E1, #stemkeuze TK21
                    E2, #Links rechts plaatsing
                    F1_1:F1_9, #populistische attitudes
                    F2_1:F2_9, # vertrouwen
                    H4, #politiek sentiment
                    I1_1:I1_7, #media consumptie
                    I20_1:I20_6, #vertrowuen in media kanalen
                    I21_1:I21_3, #controloeren van feiten
                    weights) %>% 
  mutate(A4_1 = NA,
         A4_2 = NA,
         A4_3 = NA,
         A4_4 = NA,
         A4_5 = NA,
         A4_6 = NA,
         A4_7 = NA,
         A4_8 = NA,
         A4_9 = NA,
         A4_10 = NA,
         A4_11 = NA,
         A4_12 = NA,
         A4_13 = NA,
         A4_14 = NA,
         A4_15 = NA,
         A4_16 = NA,
         A4_17 = NA,
         A4_18 = NA, 
         I22 = NA)

load(here("data/raw-private/cleaned_data_w2.RData"))
d2 <- d2 %>% select(id:urbanisation, #demografische kenmerken
                    A2a, A2b, #stemintentie nationaal & lokaal
                    A4_1:A4_16, #ptv's voor persoonlijke choice set aan partijen
                    H4, #politiek sentiment
                    I1_1:I1_7, #media consumptie
                    weights) 

load(here("data/raw-private/cleaned_data_w3.RData"))
d3 <- d3 %>% select(id:urbanisation, #demografische kenmerken
                    A2a, A2b, #stemintentie nationaal & lokaal
                    H4, #politiek sentiment
                    I1_1:I1_7, #media consumptie
                    weights)

load(here("data/raw-private/cleaned_data_w4.RData"))
d4 <- d4 %>% select(id:urbanisation, #demografische kenmerken
                    A2a, A2b, #stemintentie nationaal & lokaal
                    H4, #politiek sentiment
                    I1_1:I1_7, #media consumptie
                    weights, wave)

load(here("data/raw-private/cleaned_data_w5.RData"))
d5 <- d5 %>% select(id:urbanisation, #demografische kenmerken
                    A2a, A2b, #stemgedrag nationaal & lokaal
                    H4, #politiek sentiment
                    I1_1:I1_7, #media consumptie
                    I22, #tijd op sociale media
                    weights)

d <- d1 %>%
  add_case(d2) %>% 
  add_case(d3) %>% 
  add_case(d4) %>% 
  add_case(d5)