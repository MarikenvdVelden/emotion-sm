Prepare Data
================

- [Required Packages &
  Reproducibility](#required-packages--reproducibility)
- [Tidy Data](#tidy-data)
- [Constructie van variabelen](#constructie-van-variabelen)
  - [Data](#data)
  - [Sociale Media gebruik (I1_5)](#sociale-media-gebruik-i1_5)
  - [Emoties](#emoties)
  - [Volatileit](#volatileit)
- [Data Beschrijving](#data-beschrijving)
  - [Sociale Media gebruik](#sociale-media-gebruik)
  - [Emoties](#emoties-1)
  - [Volatiliteit](#volatiliteit)
- [Testen Hypothesen](#testen-hypothesen)
  - [regressies](#regressies)

## Required Packages & Reproducibility

``` r
rm(list=ls())
source(here::here("src/lib/functions.R"))
#renv::snapshot()
```

## Tidy Data

``` r
source(here("src/data-processing/get_data.R"))
```

# Constructie van variabelen

## Data

Filter data op mensen die 3 of meer keer hebben meegedaan

``` r
n <- d %>% 
  group_by(id) %>% 
  count() %>% 
  filter(n>=3 & n<6) %>% 
  ungroup() 

d <- left_join(n, d, by = "id") %>% 
  select(-n)
```

## Sociale Media gebruik (I1_5)

categorien maken:

1.  social media hoger dan gemiddeld & andere media hoger dan gemiddeld,
    (news junkies)
2.  social media hoger dan gemiddeld & andere lager dan gemiddeld,
    (categorie waar we geintereerd in zijn)
3.  social media lager dan gemiddeld (mediaan) & andere media hoger dan
    gemiddeld
4.  social media lager dan gemiddeld (mediaan) & andere lager dan
    gemiddeld (news avoiders)

## Emoties

1.  Angst (0/1)
2.  Woede = of Afschuw of Wantrouwen (0/1)

## Volatileit

Typen:

1.  Conversie-inter: verandering van stemintentie in w1-w4 (veranderen
    gedurende campage) tussen de “blokken”
2.  Conversie-intra: verandering van stemintentie in w1-w4 (veranderen
    gedurende campage) binnen het “blok”
3.  Conversie-choiceset: verandering van stemintentie in w1-w4
    (veranderen gedurende campage) binnen de choice set obv PTV
4.  Kristalisatie-inter: veranderen van laatste stemintentie tov
    stemkeuze (w5) tussen de “blokken”
5.  Kristalisatie-intra: veranderen van laatste stemintentie tov
    stemkeuze (w5) binnen het “blok”
6.  Kristalisatie-choiceset: veranderen van laatste stemintentie tov
    stemkeuze (w5) binnen de choice set obv PTV
7.  Versteviging-inter: verandering stemkeuze TK21 naar stemkeuze w5
    tussen de “blokken”
8.  Versteviging-intra: verandering stemkeuze TK21 naar stemkeuze w5
    binnen het “blok”
9.  Versteviging-choiceset: verandering stemkeuze TK21 naar stemkeuze w5
    binnen de choice set obv PTV

``` r
source(here("src/data-processing/operationalization.R"))
save(df, file = here("data/intermediate/cleaned_data_allwaves.RData"))
```

# Data Beschrijving

## Sociale Media gebruik

welke mensen zitten in categorie?

``` r
source(here("src/data-processing/descr_sm.R"))
p1 #demografisch profiel obv SM consumptie
```

<img src="../../report/figures/descr-sm-1.png" style="display: block; margin: auto;" />

``` r
p2 #profiel poltieke achtergrond
```

<img src="../../report/figures/descr-sm-2.png" style="display: block; margin: auto;" />

``` r
rm(tmp)
```

## Emoties

welke mensen ervaren welk politiek sentiment?

``` r
source(here("src/data-processing/descr_emotion.R"))
p1 #demografisch profiel obv angst 
```

<img src="../../report/figures/descr-emoties-1.png" style="display: block; margin: auto;" />

``` r
p2 #profiel poltieke achtergrond obv angst
```

<img src="../../report/figures/descr-emoties-2.png" style="display: block; margin: auto;" />

``` r
p3 #demografisch profiel obv woede 
```

<img src="../../report/figures/descr-emoties-3.png" style="display: block; margin: auto;" />

``` r
p4 #profiel poltieke achtergrond obv woede
```

<img src="../../report/figures/descr-emoties-4.png" style="display: block; margin: auto;" />

``` r
p1b #demografisch profiel obv angst (relatief)
```

<img src="../../report/figures/descr-emoties-5.png" style="display: block; margin: auto;" />

``` r
p2b #profiel poltieke achtergrond obv angst (relatief)
```

<img src="../../report/figures/descr-emoties-6.png" style="display: block; margin: auto;" />

``` r
p3b #demografisch profiel obv woede (relatief)
```

<img src="../../report/figures/descr-emoties-7.png" style="display: block; margin: auto;" />

``` r
p4b #profiel poltieke achtergrond obv woede (relatief)
```

<img src="../../report/figures/descr-emoties-8.png" style="display: block; margin: auto;" />

``` r
rm(tmp)
```

## Volatiliteit

welke mensen zitten in categorie?

- voor alle type volatiliteit geldt dat binnen choice-set overlapt met
  of intra-blok of inter-blok

``` r
source(here("src/data-processing/descr_vol.R"))
p1 #demografisch profiel obv conversie 
```

<img src="../../report/figures/descr-vol-1.png" style="display: block; margin: auto;" />

``` r
p2 #profiel poltieke achtergrond obv conversie
```

<img src="../../report/figures/descr-vol-2.png" style="display: block; margin: auto;" />

``` r
p3 #profiel poltieke achtergrond obv kristalisatie
```

<img src="../../report/figures/descr-vol-3.png" style="display: block; margin: auto;" />

``` r
p4 #profiel poltieke achtergrond obv kristalisatie
```

<img src="../../report/figures/descr-vol-4.png" style="display: block; margin: auto;" />

``` r
p5 #profiel poltieke achtergrond obv versteviging
```

<img src="../../report/figures/descr-vol-5.png" style="display: block; margin: auto;" />

``` r
p6 #profiel poltieke achtergrond obv versteviging
```

<img src="../../report/figures/descr-vol-6.png" style="display: block; margin: auto;" />

``` r
p1b #demografisch profiel obv conversie (choice set)
```

<img src="../../report/figures/descr-vol-7.png" style="display: block; margin: auto;" />

``` r
p2b #profiel poltieke achtergrond obv conversie (choice set)
```

<img src="../../report/figures/descr-vol-8.png" style="display: block; margin: auto;" />

``` r
p3b #profiel poltieke achtergrond obv kristalisatie (choice set)
```

<img src="../../report/figures/descr-vol-9.png" style="display: block; margin: auto;" />

``` r
p4b #profiel poltieke achtergrond obv kristalisatie (choice set)
```

<img src="../../report/figures/descr-vol-10.png" style="display: block; margin: auto;" />

``` r
p5b #profiel poltieke achtergrond obv versteviging (choice set)
```

<img src="../../report/figures/descr-vol-11.png" style="display: block; margin: auto;" />

``` r
p6b #profiel poltieke achtergrond obv versteviging (choice set)
```

<img src="../../report/figures/descr-vol-12.png" style="display: block; margin: auto;" />

``` r
kableExtra::kbl(tab, booktabs =T, caption = "\\label{tab:conditions}Hoeveel participanten per volatileitsblok") %>%
  kableExtra::kable_styling(latex_options = c("striped", "hold_position"),
                full_width = F, fixed_thead = T, position = "center") %>%
  kableExtra::column_spec(1, width = "8cm") %>%
  kableExtra::column_spec(2, width = "2cm")
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
Hoeveel participanten per volatileitsblok
</caption>
<thead>
<tr>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
Volatiliteit
</th>
<th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;">
n
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;width: 8cm; ">
Conversie binnen Ideologisch Blok
</td>
<td style="text-align:right;width: 2cm; ">
275
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Conversie tusssen Ideologische Blokken
</td>
<td style="text-align:right;width: 2cm; ">
805
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Geen Conversie
</td>
<td style="text-align:right;width: 2cm; ">
7446
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Conversie binnen Choice-Set
</td>
<td style="text-align:right;width: 2cm; ">
805
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Geen Kristalisatie
</td>
<td style="text-align:right;width: 2cm; ">
8086
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Kristalisatie binnen Ideologisch Blok
</td>
<td style="text-align:right;width: 2cm; ">
210
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Kristalisatie tusssen Ideologische Blokken
</td>
<td style="text-align:right;width: 2cm; ">
230
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Kristalisatie binnen Choice-Set
</td>
<td style="text-align:right;width: 2cm; ">
210
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Geen Versteviging
</td>
<td style="text-align:right;width: 2cm; ">
7241
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Versteviging binnen Ideologisch Blok
</td>
<td style="text-align:right;width: 2cm; ">
515
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Versteviging tusssen Ideologische Blokken
</td>
<td style="text-align:right;width: 2cm; ">
770
</td>
</tr>
<tr>
<td style="text-align:left;width: 8cm; ">
Versteviging binnen Choice-Set
</td>
<td style="text-align:right;width: 2cm; ">
515
</td>
</tr>
</tbody>
</table>

``` r
rm(tmp, tab)
```

# Testen Hypothesen

## regressies

H1: Y = woede/angst, X = sm gebruik

- Sociale media gebruik is gemeten door te kijken hoe vaak de respondent
  in het aantal waves dat zij meedoet in de categorie social media hoger
  dan gemiddeld & andere media lager dan gemiddeld valt. `0` betekent
  dat de respondent daar nooit invalt, `1` betekent dat de respondent
  daar iedere keer dat zij meedoet invalt, `0.25` betekent dat ze daar
  een van de vier kere in die categorie valt.
- Angst en woede zijn op een zelfde manier gemeten
- Model: OLS regressie -\> geen sterke causale test!
- De regressieanalyse laat zien hoe meer sociale media mensen gbruken
  voor politiek nieuws, hoe kleiner de kans is dat ze woede/angst
  rapporteren. Beide effecten zijn statistisch significant.
- exploratieve moderaties met mediageletterdheid en aantal uur actief op
  SM laten zien dat deze variabelen de richting van het effect niet
  veranderen.

``` r
source(here("src/analysis/h1.R"))
h1 #effect van social media use op angst/woede
```

<img src="../../report/figures/h1-1.png" style="display: block; margin: auto;" />

``` r
h1a_e #effect van social media use op angst gemodereerd door mediageletterdheid
```

<img src="../../report/figures/h1-2.png" style="display: block; margin: auto;" />

``` r
h1b_e #effect van social media use op woede gemodereerd door mediageletterdheid
```

<img src="../../report/figures/h1-3.png" style="display: block; margin: auto;" />

``` r
h1c_e #effect van social media use op angst gemodereerd door uur op social media
```

<img src="../../report/figures/h1-4.png" style="display: block; margin: auto;" />

``` r
h1d_e #effect van social media use op woede gemodereerd door uur op social media
```

<img src="../../report/figures/h1-5.png" style="display: block; margin: auto;" />

``` r
kableExtra::kbl(h1a)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
term
</th>
<th style="text-align:right;">
estimate
</th>
<th style="text-align:right;">
std.error
</th>
<th style="text-align:right;">
statistic
</th>
<th style="text-align:right;">
p.value
</th>
<th style="text-align:left;">
hyp
</th>
<th style="text-align:left;">
dv
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.70
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
10.30
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
smc_tot
</td>
<td style="text-align:right;">
-0.08
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-2.89
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
3.17
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:right;">
0.67
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
-0.61
</td>
<td style="text-align:right;">
0.54
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.05
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-1.46
</td>
<td style="text-align:right;">
0.14
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
0.16
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
5.58
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.12
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
5.56
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.09
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
2.49
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.76
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
-0.21
</td>
<td style="text-align:right;">
0.84
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.81
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.25
</td>
<td style="text-align:right;">
0.80
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.07
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
-1.74
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
-0.06
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-2.24
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
-0.04
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
-1.05
</td>
<td style="text-align:right;">
0.29
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
-0.15
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-10.16
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
</tr>
</tbody>
</table>

``` r
kableExtra::kbl(h1b)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
term
</th>
<th style="text-align:right;">
estimate
</th>
<th style="text-align:right;">
std.error
</th>
<th style="text-align:right;">
statistic
</th>
<th style="text-align:right;">
p.value
</th>
<th style="text-align:left;">
hyp
</th>
<th style="text-align:left;">
dv
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
1.04
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
14.70
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
smc_tot
</td>
<td style="text-align:right;">
-0.06
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-2.32
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
2.64
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:right;">
0.45
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
-0.05
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
-0.94
</td>
<td style="text-align:right;">
0.34
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.04
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-1.26
</td>
<td style="text-align:right;">
0.21
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
5.09
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.13
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
5.84
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.11
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
2.77
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
2.66
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.67
</td>
<td style="text-align:right;">
0.50
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.18
</td>
<td style="text-align:right;">
0.24
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
-0.04
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-1.04
</td>
<td style="text-align:right;">
0.30
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.08
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
-1.87
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
-0.06
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-2.08
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
-0.04
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
-1.13
</td>
<td style="text-align:right;">
0.26
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
-0.23
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-15.08
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1b
</td>
<td style="text-align:left;">
Woede
</td>
</tr>
</tbody>
</table>

``` r
rm(dm, h1, h1a, h1b, h1c, h1d, h1a_e, h1b_e, h1c_e, h1d_e, tmp)
```

H2: Y = volatiliteit, x = woede/angst

- metingen volatileit zie bovenstaande
- zoals in h1 (maar w1-w4 voor conversie)
- geen significante effecten van emotie op volatileit, behalve voor
  angst op versteviging: positief en significant effect
- model: linear probability model (ols regressie met waardes `0` en `1`
  van de onafhankelijke variabelen)
- geen sterke causale toets
- interpretatie voorbeeld: als je angst rapporteert gaat de kans dat je
  versteviging-volatiel bent binnen je choice-set met `2.5` procent punt
  omhoog.
- voor conversie: woede insignificant maar negatief effect, angst
  insignificant maar positief effect, behalve bij inter-blok
- voor kristalisatie: alle coefficienten gaan de verwachtte richting uit
  (positief, maar niet significant)
- voor verstevigging: alle coefficienten gaan de verwachtte richting
  uit, maar geen significante resultaten voor woede

``` r
source(here("src/analysis/h2.R"))
h2 #effect van angst/woede op volatiliteit
```

<img src="../../report/figures/h2-1.png" style="display: block; margin: auto;" />

``` r
kableExtra::kbl(h2a)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
term
</th>
<th style="text-align:right;">
estimate
</th>
<th style="text-align:right;">
std.error
</th>
<th style="text-align:right;">
statistic
</th>
<th style="text-align:right;">
p.value
</th>
<th style="text-align:left;">
hyp
</th>
<th style="text-align:left;">
emotie
</th>
<th style="text-align:left;">
dv
</th>
<th style="text-align:left;">
id
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
-0.05
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
-0.90
</td>
<td style="text-align:right;">
0.37
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
anxiety_tot
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.23
</td>
<td style="text-align:right;">
0.82
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
2.48
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.16
</td>
<td style="text-align:right;">
0.87
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
2.02
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.04
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.85
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.22
</td>
<td style="text-align:right;">
0.22
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.31
</td>
<td style="text-align:right;">
0.19
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.38
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:right;">
0.67
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.41
</td>
<td style="text-align:right;">
0.68
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.43
</td>
<td style="text-align:right;">
0.67
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.09
</td>
<td style="text-align:right;">
0.27
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.06
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-2.01
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.07
</td>
<td style="text-align:right;">
0.95
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.21
</td>
<td style="text-align:right;">
0.84
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
1.86
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
-0.05
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
-0.90
</td>
<td style="text-align:right;">
0.37
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anxiety_tot
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.23
</td>
<td style="text-align:right;">
0.82
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
2.48
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.16
</td>
<td style="text-align:right;">
0.87
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
2.02
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.04
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.85
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.22
</td>
<td style="text-align:right;">
0.22
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.31
</td>
<td style="text-align:right;">
0.19
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.38
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:right;">
0.67
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.41
</td>
<td style="text-align:right;">
0.68
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.43
</td>
<td style="text-align:right;">
0.67
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.09
</td>
<td style="text-align:right;">
0.27
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.06
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-2.01
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.07
</td>
<td style="text-align:right;">
0.95
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.21
</td>
<td style="text-align:right;">
0.84
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
1.86
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.10
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
3.04
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anxiety_tot
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.38
</td>
<td style="text-align:right;">
0.71
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
-1.26
</td>
<td style="text-align:right;">
0.21
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-1.44
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.82
</td>
<td style="text-align:right;">
0.41
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.43
</td>
<td style="text-align:right;">
0.67
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.19
</td>
<td style="text-align:right;">
0.85
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.81
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.79
</td>
<td style="text-align:right;">
0.43
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.48
</td>
<td style="text-align:right;">
0.63
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.85
</td>
<td style="text-align:right;">
0.39
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-1.11
</td>
<td style="text-align:right;">
0.27
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
2.22
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.74
</td>
<td style="text-align:right;">
0.46
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.33
</td>
<td style="text-align:right;">
0.74
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.55
</td>
<td style="text-align:right;">
0.58
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-1.73
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:right;">
0.87
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
anxiety_tot
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.62
</td>
<td style="text-align:right;">
0.54
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
1.64
</td>
<td style="text-align:right;">
0.10
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.62
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.14
</td>
<td style="text-align:right;">
0.89
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.22
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.58
</td>
<td style="text-align:right;">
0.56
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.58
</td>
<td style="text-align:right;">
0.56
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.51
</td>
<td style="text-align:right;">
0.13
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.24
</td>
<td style="text-align:right;">
0.81
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.14
</td>
<td style="text-align:right;">
0.89
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.13
</td>
<td style="text-align:right;">
0.90
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.28
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.14
</td>
<td style="text-align:right;">
0.25
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.77
</td>
<td style="text-align:right;">
0.44
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.61
</td>
<td style="text-align:right;">
0.54
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.27
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:right;">
0.87
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anxiety_tot
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.62
</td>
<td style="text-align:right;">
0.54
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
1.64
</td>
<td style="text-align:right;">
0.10
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.62
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.14
</td>
<td style="text-align:right;">
0.89
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.22
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.58
</td>
<td style="text-align:right;">
0.56
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.58
</td>
<td style="text-align:right;">
0.56
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.51
</td>
<td style="text-align:right;">
0.13
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.24
</td>
<td style="text-align:right;">
0.81
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.14
</td>
<td style="text-align:right;">
0.89
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.13
</td>
<td style="text-align:right;">
0.90
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.28
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.14
</td>
<td style="text-align:right;">
0.25
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.77
</td>
<td style="text-align:right;">
0.44
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.61
</td>
<td style="text-align:right;">
0.54
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.27
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.21
</td>
<td style="text-align:right;">
0.23
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anxiety_tot
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
1.18
</td>
<td style="text-align:right;">
0.24
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
-0.30
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.29
</td>
<td style="text-align:right;">
0.77
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.37
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
2.56
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.03
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.37
</td>
<td style="text-align:right;">
0.71
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.71
</td>
<td style="text-align:right;">
0.48
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.32
</td>
<td style="text-align:right;">
0.75
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.94
</td>
<td style="text-align:right;">
0.35
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-1.13
</td>
<td style="text-align:right;">
0.26
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.73
</td>
<td style="text-align:right;">
0.46
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
3.84
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.84
</td>
<td style="text-align:right;">
0.40
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.31
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.53
</td>
<td style="text-align:right;">
0.59
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
-0.15
</td>
<td style="text-align:right;">
0.88
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
anxiety_tot
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.55
</td>
<td style="text-align:right;">
0.12
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
1.68
</td>
<td style="text-align:right;">
0.09
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.29
</td>
<td style="text-align:right;">
0.77
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
2.45
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.10
</td>
<td style="text-align:right;">
0.27
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.53
</td>
<td style="text-align:right;">
0.59
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
1.05
</td>
<td style="text-align:right;">
0.29
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.15
</td>
<td style="text-align:right;">
0.25
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.00
</td>
<td style="text-align:right;">
0.32
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.76
</td>
<td style="text-align:right;">
0.45
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.28
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:right;">
0.86
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.77
</td>
<td style="text-align:right;">
0.44
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.81
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.80
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.36
</td>
<td style="text-align:right;">
0.72
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
-0.15
</td>
<td style="text-align:right;">
0.88
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anxiety_tot
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.55
</td>
<td style="text-align:right;">
0.12
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
1.68
</td>
<td style="text-align:right;">
0.09
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.29
</td>
<td style="text-align:right;">
0.77
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
2.45
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.10
</td>
<td style="text-align:right;">
0.27
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.53
</td>
<td style="text-align:right;">
0.59
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
1.05
</td>
<td style="text-align:right;">
0.29
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.15
</td>
<td style="text-align:right;">
0.25
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.00
</td>
<td style="text-align:right;">
0.32
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.76
</td>
<td style="text-align:right;">
0.45
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.28
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:right;">
0.86
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.77
</td>
<td style="text-align:right;">
0.44
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.81
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.80
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.36
</td>
<td style="text-align:right;">
0.72
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:right;">
2.73
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anxiety_tot
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.80
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:right;">
0.93
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.34
</td>
<td style="text-align:right;">
0.18
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.26
</td>
<td style="text-align:right;">
0.79
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.37
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.71
</td>
<td style="text-align:right;">
0.47
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
3.06
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
-0.04
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-1.19
</td>
<td style="text-align:right;">
0.23
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
-0.04
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.90
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.06
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-1.91
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
-0.07
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-3.06
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
3.30
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
2.22
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.90
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.64
</td>
<td style="text-align:right;">
0.10
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.88
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Angst
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
</tbody>
</table>

``` r
kableExtra::kbl(h2b)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
term
</th>
<th style="text-align:right;">
estimate
</th>
<th style="text-align:right;">
std.error
</th>
<th style="text-align:right;">
statistic
</th>
<th style="text-align:right;">
p.value
</th>
<th style="text-align:left;">
hyp
</th>
<th style="text-align:left;">
emotie
</th>
<th style="text-align:left;">
dv
</th>
<th style="text-align:left;">
id
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
-0.54
</td>
<td style="text-align:right;">
0.59
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
anger_tot
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.79
</td>
<td style="text-align:right;">
0.43
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
2.55
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:right;">
0.87
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
2.00
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.05
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.88
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.09
</td>
<td style="text-align:right;">
0.28
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.46
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.45
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.50
</td>
<td style="text-align:right;">
0.62
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.39
</td>
<td style="text-align:right;">
0.69
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.46
</td>
<td style="text-align:right;">
0.65
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.11
</td>
<td style="text-align:right;">
0.27
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.07
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-2.07
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.13
</td>
<td style="text-align:right;">
0.90
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:right;">
0.88
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
1.45
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
-0.54
</td>
<td style="text-align:right;">
0.59
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anger_tot
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.79
</td>
<td style="text-align:right;">
0.43
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
2.55
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:right;">
0.87
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
2.00
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.05
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.88
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.09
</td>
<td style="text-align:right;">
0.28
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.46
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.45
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.50
</td>
<td style="text-align:right;">
0.62
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.39
</td>
<td style="text-align:right;">
0.69
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.46
</td>
<td style="text-align:right;">
0.65
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.11
</td>
<td style="text-align:right;">
0.27
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.07
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-2.07
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.13
</td>
<td style="text-align:right;">
0.90
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:right;">
0.88
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
1.45
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.11
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
3.30
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anger_tot
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-1.25
</td>
<td style="text-align:right;">
0.21
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
-1.19
</td>
<td style="text-align:right;">
0.24
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-1.43
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.80
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.41
</td>
<td style="text-align:right;">
0.68
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.29
</td>
<td style="text-align:right;">
0.77
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.95
</td>
<td style="text-align:right;">
0.34
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.72
</td>
<td style="text-align:right;">
0.47
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.56
</td>
<td style="text-align:right;">
0.57
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.83
</td>
<td style="text-align:right;">
0.40
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-1.09
</td>
<td style="text-align:right;">
0.28
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
2.20
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.69
</td>
<td style="text-align:right;">
0.49
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.28
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.60
</td>
<td style="text-align:right;">
0.55
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.02
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Conversie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.21
</td>
<td style="text-align:right;">
0.83
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
anger_tot
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.30
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
1.67
</td>
<td style="text-align:right;">
0.10
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.61
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.14
</td>
<td style="text-align:right;">
0.89
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.24
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.64
</td>
<td style="text-align:right;">
0.53
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.53
</td>
<td style="text-align:right;">
0.59
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.53
</td>
<td style="text-align:right;">
0.13
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.23
</td>
<td style="text-align:right;">
0.82
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.13
</td>
<td style="text-align:right;">
0.89
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.12
</td>
<td style="text-align:right;">
0.90
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.27
</td>
<td style="text-align:right;">
0.79
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.15
</td>
<td style="text-align:right;">
0.25
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:right;">
0.45
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.61
</td>
<td style="text-align:right;">
0.55
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.22
</td>
<td style="text-align:right;">
0.83
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.21
</td>
<td style="text-align:right;">
0.83
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anger_tot
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.30
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
1.67
</td>
<td style="text-align:right;">
0.10
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.61
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.14
</td>
<td style="text-align:right;">
0.89
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.24
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.64
</td>
<td style="text-align:right;">
0.53
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.53
</td>
<td style="text-align:right;">
0.59
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.53
</td>
<td style="text-align:right;">
0.13
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.23
</td>
<td style="text-align:right;">
0.82
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.13
</td>
<td style="text-align:right;">
0.89
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.12
</td>
<td style="text-align:right;">
0.90
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.27
</td>
<td style="text-align:right;">
0.79
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.15
</td>
<td style="text-align:right;">
0.25
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:right;">
0.45
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.61
</td>
<td style="text-align:right;">
0.55
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.22
</td>
<td style="text-align:right;">
0.83
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.13
</td>
<td style="text-align:right;">
0.26
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anger_tot
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.94
</td>
<td style="text-align:right;">
0.35
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
-0.28
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.29
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.37
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
2.55
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-1.98
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.40
</td>
<td style="text-align:right;">
0.69
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.72
</td>
<td style="text-align:right;">
0.47
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.33
</td>
<td style="text-align:right;">
0.74
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.96
</td>
<td style="text-align:right;">
0.34
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-1.13
</td>
<td style="text-align:right;">
0.26
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.77
</td>
<td style="text-align:right;">
0.44
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
3.83
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.83
</td>
<td style="text-align:right;">
0.41
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.31
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-0.47
</td>
<td style="text-align:right;">
0.64
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Kristalisatie
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.96
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
anger_tot
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.57
</td>
<td style="text-align:right;">
0.57
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
1.74
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.31
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
2.44
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.15
</td>
<td style="text-align:right;">
0.25
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.37
</td>
<td style="text-align:right;">
0.71
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
1.18
</td>
<td style="text-align:right;">
0.24
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.21
</td>
<td style="text-align:right;">
0.22
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.96
</td>
<td style="text-align:right;">
0.33
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.78
</td>
<td style="text-align:right;">
0.44
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.26
</td>
<td style="text-align:right;">
0.79
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.20
</td>
<td style="text-align:right;">
0.84
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.81
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:right;">
0.45
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:right;">
0.43
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.16
</td>
<td style="text-align:right;">
0.87
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Choice-Set
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.96
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anger_tot
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.57
</td>
<td style="text-align:right;">
0.57
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
1.74
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.31
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.08
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
2.44
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.15
</td>
<td style="text-align:right;">
0.25
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.37
</td>
<td style="text-align:right;">
0.71
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
1.18
</td>
<td style="text-align:right;">
0.24
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.21
</td>
<td style="text-align:right;">
0.22
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.96
</td>
<td style="text-align:right;">
0.33
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.78
</td>
<td style="text-align:right;">
0.44
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
-0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.26
</td>
<td style="text-align:right;">
0.79
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.20
</td>
<td style="text-align:right;">
0.84
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
-0.02
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-0.81
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.76
</td>
<td style="text-align:right;">
0.45
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.78
</td>
<td style="text-align:right;">
0.43
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.16
</td>
<td style="text-align:right;">
0.87
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Intra-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
(Intercept)
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:right;">
2.63
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
anger_tot
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.31
</td>
<td style="text-align:right;">
0.19
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0.12
</td>
<td style="text-align:right;">
0.90
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(sex)Male
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.35
</td>
<td style="text-align:right;">
0.18
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Non-Western Migrant
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.27
</td>
<td style="text-align:right;">
0.79
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(ethnicity)Western Migrant
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.34
</td>
<td style="text-align:right;">
0.18
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Low
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
0.81
</td>
<td style="text-align:right;">
0.42
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(education)Medium
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
3.12
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)North of the country
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-1.16
</td>
<td style="text-align:right;">
0.25
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)South of the country
</td>
<td style="text-align:right;">
-0.04
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-1.91
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)Three big cities (Amsterdam, Rotterdam, The Hague)
</td>
<td style="text-align:right;">
-0.06
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
-1.94
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(region)West of the country
</td>
<td style="text-align:right;">
-0.07
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-3.06
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Medium urbanised
</td>
<td style="text-align:right;">
0.09
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
3.34
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Not urbanised
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
2.20
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Strongly urbanised
</td>
<td style="text-align:right;">
0.04
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
1.87
</td>
<td style="text-align:right;">
0.06
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
factor(urbanisation)Very strongly urbanised
</td>
<td style="text-align:right;">
0.05
</td>
<td style="text-align:right;">
0.03
</td>
<td style="text-align:right;">
1.63
</td>
<td style="text-align:right;">
0.10
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
<tr>
<td style="text-align:left;">
media_lit
</td>
<td style="text-align:right;">
-0.03
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:right;">
-2.75
</td>
<td style="text-align:right;">
0.01
</td>
<td style="text-align:left;">
H1a
</td>
<td style="text-align:left;">
Woede
</td>
<td style="text-align:left;">
Versteviging
</td>
<td style="text-align:left;">
Inter-Blok
</td>
</tr>
</tbody>
</table>

H3: moderatie: sociale media \* emotie op volatiliteit

- geen significant effect van moderatie angst\*smc op conversie
  choice-set

- geen significant effect van moderatie angst\*smc op conversie
  intra-blok

- geen significant effect van moderatie angst\*smc op conversie
  inter-blok

- geen significant effect van moderatie angst\*smc op kristalisatie
  choice-set

- geen significant effect van moderatie angst\*smc op kristalisatie
  intra-blok

- geen significant effect van moderatie angst\*smc op kristalisatie
  inter-blok

- geen significant effect van moderatie angst\*smc op versteviging
  choice-set

- geen significant effect van moderatie angst\*smc op versteviging
  intra-blok

- geen significant effect van moderatie angst\*smc op versteviging
  inter-blok

- geen significant effect van moderatie woede\*smc op conversie
  choice-set

- geen significant effect van moderatie woede\*smc op conversie
  intra-blok

- geen significant effect van moderatie woede\*smc op conversie
  inter-blok

- geen significant effect van moderatie woede\*smc op kristalisatie
  choice-set

- geen significant effect van moderatie woede\*smc op kristalisatie
  intra-blok

- geen significant effect van moderatie woede\*smc op kristalisatie
  inter-blok

- geen significant effect van moderatie woede\*smc op versteviging
  choice-set

- geen significant effect van moderatie woede\*smc op versteviging
  intra-blok

- geen significant effect van moderatie woede\*smc op versteviging
  inter-bloks

``` r
source(here("src/analysis/h3.R")) #2 voorbeeld visualisaties, aangezien niets significant is
#effecten van angst/woede*smc op volatiliteit
h3a_1 #de voorspelde waarschijnlijkheid op volatilieit gaat omhoog naar mate men meer angst rapporteert voor de groep bovenmatige sociale media nieuwsgebruikers, voor de andere groupen gaat de voorspelde waarschijnlijkheid op volatilieit omlaag naar mate men meer angst rapporteert 
```

<img src="../../report/figures/h3-1.png" style="display: block; margin: auto;" />

``` r
h3b_1 #de voorspelde waarschijnlijkheid op volatilieit blijft min of meer gelijk naar mate men meer angst rapporteert voor de groep bovenmatige sociale media nieuwsgebruikers, voor de andere groupen gaat de voorspelde waarschijnlijkheid op volatilieit omlaag naar mate men meer angst rapporteert 
```

<img src="../../report/figures/h3-2.png" style="display: block; margin: auto;" />
