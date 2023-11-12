## John McCormick
## CWRU Journal of Economics Team 3

## Data Processing for Unemployment Data
library(tidyverse)

butlerCounty <- read.csv("UnemploymentData/ButlerCounty.csv", header=TRUE) %>%
  mutate(County = "Butler") %>%
  mutate(State = "OH")

clermontCounty <- read.csv("UnemploymentData/ClermontCounty.csv", header=TRUE) %>%
  mutate(County = "Clermont") %>%
  mutate(State = "OH")

delawareCounty <- read.csv("UnemploymentData/DelawareCounty.csv", header=TRUE) %>%
  mutate(County = "Delaware") %>%
  mutate(State = "OH")

fairfieldCounty <- read.csv("UnemploymentData/FairfieldCounty.csv", header=TRUE) %>%
  mutate(County = "Fairfield") %>%
  mutate(State = "OH")

geaugaCounty <- read.csv("UnemploymentData/GeaugaCounty.csv", header=TRUE) %>%
  mutate(County = "Geauga") %>%
  mutate(State = "OH")

lakeCounty <- read.csv("UnemploymentData/LakeCounty.csv", header=TRUE) %>%
  mutate(County = "Lake") %>%
  mutate(State = "OH")

lickingCounty <- read.csv("UnemploymentData/LickingCounty.csv", header=TRUE) %>%
  mutate(County = "Licking") %>%
  mutate(State = "OH")

lorainCounty <- read.csv("UnemploymentData/LorainCounty.csv", header=TRUE) %>%
  mutate(County = "Lorain") %>%
  mutate(State = "OH")

madisonCounty <- read.csv("UnemploymentData/MadisonCounty.csv", header=TRUE) %>%
  mutate(County = "Madison") %>%
  mutate(State = "OH")

medinaCounty <- read.csv("UnemploymentData/MedinaCounty.csv", header=TRUE) %>%
  mutate(County = "Medina") %>%
  mutate(State = "OH")

pickawayCounty <- read.csv("UnemploymentData/PickawayCounty.csv", header=TRUE) %>%
  mutate(County = "Pickaway") %>%
  mutate(State = "OH")

summitCounty <- read.csv("UnemploymentData/SummitCounty.csv", header=TRUE) %>%
  mutate(County = "Summit") %>%
  mutate(State = "OH")

unionCounty <- read.csv("UnemploymentData/UnionCounty.csv", header=TRUE) %>%
  mutate(County = "Union") %>%
  mutate(State = "OH")

warrenCounty <- read.csv("UnemploymentData/WarrenCounty.csv", header=TRUE) %>%
  mutate(County = "Warren") %>%
  mutate(State = "OH")

# Michigan 
monroeCounty <- read.csv("UnemploymentData/MonroeCounty.csv", header=T) %>%
  mutate(County = "Monroe") %>%
  mutate(State = "MI")

lenaweeCounty <- read.csv("UnemploymentData/LenaweeCounty.csv", header=T) %>%
  mutate(County = "Lenawee") %>%
  mutate(State = "MI")

jacksonCounty <- read.csv("UnemploymentData/JacksonCounty.csv", header=T) %>%
  mutate(County = "Jackson") %>%
  mutate(State = "MI")

inghamCounty <- read.csv("UnemploymentData/InghamCounty.csv", header=T) %>%
  mutate(County = "Ingham") %>%
  mutate(State = "MI")

livingstonCounty <- read.csv("UnemploymentData/LivingstonCounty.csv", header=T) %>%
  mutate(County = "Livingston") %>%
  mutate(State = "MI")

macombCounty <- read.csv("UnemploymentData/MacombCounty.csv", header=T) %>%
  mutate(County = "Macomb") %>%
  mutate(State = "MI")

washtenawCounty <- read.csv("UnemploymentData/WashtenawCounty.csv", header=T) %>%
  mutate(County = "Washtenaw") %>%
  mutate(State = "MI")

#Minnesota
dakotaCounty <- read.csv("UnemploymentData/DakotaCounty.csv", header=T) %>%
  mutate(County = "Dakota") %>%
  mutate(State = "MN")

scottCounty <- read.csv("UnemploymentData/ScottCounty.csv", header=T) %>%
  mutate(County = "Scott") %>%
  mutate(State = "MN")

carverCounty <- read.csv("UnemploymentData/CarverCounty.csv", header=T) %>%
  mutate(County = "Carver") %>%
  mutate(State = "MN")

wrightCounty <- read.csv("UnemploymentData/WrightCounty.csv", header=T) %>%
  mutate(County = "Wright") %>%
  mutate(State = "MN")

sherburneCounty <- read.csv("UnemploymentData/SherburneCounty.csv", header=T) %>%
  mutate(County = "Sherburne") %>%
  mutate(State = "MN")

anokaCounty <- read.csv("UnemploymentData/AnokaCounty.csv", header=T) %>%
  mutate(County = "Anoka") %>%
  mutate(State = "MN")

chisagoConuty <- read.csv("UnemploymentData/ChisagoCounty.csv", header=T) %>%
  mutate(County = "Chisago") %>%
  mutate(State = "MN")




nationalData <- read.csv("UnemploymentData/USA.csv", header=TRUE) %>%
  mutate(County = "National")


combinedData <- bind_rows(
  butlerCounty, clermontCounty, delawareCounty, fairfieldCounty, 
  geaugaCounty, lakeCounty, lickingCounty, lorainCounty, 
  madisonCounty, medinaCounty, pickawayCounty, summitCounty, 
  unionCounty, warrenCounty, monroeCounty, lenaweeCounty, jacksonCounty, 
  inghamCounty, livingstonCounty, macombCounty, washtenawCounty, dakotaCounty,
  scottCounty, carverCounty, wrightCounty, sherburneCounty, anokaCounty, chisagoConuty,
  nationalData
)

save(combinedData, file = "OH_MI_MN_UnemploymentData.RData")

