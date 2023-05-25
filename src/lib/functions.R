library(tidyverse)
library(here)
library(hrbrthemes)
library(GGally)
library(broom.mixed)
library(lme4)
library(interactions)

fig_cols <- yarrr::piratepal(palette = "basel", 
                             trans = .2)
fig_cols <- as.character(fig_cols)
