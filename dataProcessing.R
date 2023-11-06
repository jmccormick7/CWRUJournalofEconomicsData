## John McCormick
## CWRU Journal of Economics Team 3

## Data Processing for Unemployment Data
library(tidyverse)

butlerCounty <- read.csv("UnemploymentData/ButlerCounty.csv", header=TRUE) %>%
  mutate(County = "Butler")

clermontCounty <- read.csv("UnemploymentData/ClermontCounty.csv", header=TRUE) %>%
  mutate(County = "Clermont")

delawareCounty <- read.csv("UnemploymentData/DelawareCounty.csv", header=TRUE) %>%
  mutate(County = "Delaware")

fairfieldCounty <- read.csv("UnemploymentData/FairfieldCounty.csv", header=TRUE) %>%
  mutate(County = "Fairfield")

geaugaCounty <- read.csv("UnemploymentData/GeaugaCounty.csv", header=TRUE) %>%
  mutate(County = "Geauga")

lakeCounty <- read.csv("UnemploymentData/LakeCounty.csv", header=TRUE) %>%
  mutate(County = "Lake")

lickingCounty <- read.csv("UnemploymentData/LickingCounty.csv", header=TRUE) %>%
  mutate(County = "Licking")

lorainCounty <- read.csv("UnemploymentData/LorainCounty.csv", header=TRUE) %>%
  mutate(County = "Lorain")

madisonCounty <- read.csv("UnemploymentData/MadisonCounty.csv", header=TRUE) %>%
  mutate(County = "Madison")

medinaCounty <- read.csv("UnemploymentData/MedinaCounty.csv", header=TRUE) %>%
  mutate(County = "Medina")

pickawayCounty <- read.csv("UnemploymentData/PickawayCounty.csv", header=TRUE) %>%
  mutate(County = "Pickaway")

summitCounty <- read.csv("UnemploymentData/SummitCounty.csv", header=TRUE) %>%
  mutate(County = "Summit")

unionCounty <- read.csv("UnemploymentData/UnionCounty.csv", header=TRUE) %>%
  mutate(County = "Union")

warrenCounty <- read.csv("UnemploymentData/WarrenCounty.csv", header=TRUE) %>%
  mutate(County = "Warren")

nationalData <- read.csv("UnemploymentData/USA.csv", header=TRUE) %>%
  mutate(County = "National")


combinedData <- bind_rows(
  butlerCounty, clermontCounty, delawareCounty, fairfieldCounty, 
  geaugaCounty, lakeCounty, lickingCounty, lorainCounty, 
  madisonCounty, medinaCounty, pickawayCounty, summitCounty, 
  unionCounty, warrenCounty, nationalData
)

save(combinedData, file = "CombinedUnemploymentData.RData")

