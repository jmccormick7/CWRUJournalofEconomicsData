## John McCormick
## CWRU Journal of Economics 
## Team 3
## Population Data Processing

data <- read.csv("PopulationData/nhgis0001_ts_nominal_county.csv", h=T) %>%
  filter(STATE %in% c("Michigan", "Minnesota", "Ohio")) %>%
  mutate(COUNTY = str_replace(COUNTY, " County", "")) %>%
  filter(COUNTY %in% c("Monroe", "Lenawee", "Jackson", "Ingham", "Livingston", "Macomb", 
                       "Washtenaw", "Dakota", "Scott", "Carver", "Wright", "Sherburne", "Anoka", "Chisago", 
                       "Butler", "Clermont", "Delaware", "Fairfield", "Geauga", "Lake", "Licking", "Lorain", 
                       "Madison", "Medina", "Pickaway", "Summit", "Union", "Warren")) %>%
  mutate(totalPop = AV0AA)

save(data, file = "totalPopulationPreliminary.RData")

