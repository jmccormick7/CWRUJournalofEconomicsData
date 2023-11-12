data <- read_csv("IncomeData/CAINC1_MI_1969_2020.csv", show_col_types = FALSE)
ohData <- read_csv("IncomeData/CAINC1_OH_1969_2020.csv", show_col_types = FALSE)
mnData <- read_csv("IncomeData/CAINC1_MN_1969_2020.csv", show_col_types = FALSE)

# Assuming the following column names based on your image:
# GeoName for County name, Year columns (1969, 1970, ..., 2020), and corresponding PersonalIncome and Population

michiganCounties = c("Monroe", "Lenawee", "Jackson", "Ingham", "Livingston", "Macomb", "Washtenaw")

minnesotaCounties = c("Dakota", "Scott", "Carver", "Wright", "Sherburne", "Anoka", "Chisago")

ohioCounties = c("Butler", "Clermont", "Delaware", "Fairfield", "Geauga", "Lake", "Licking", "Lorain", 
                 "Madison", "Medina", "Pickaway", "Summit", "Union", "Warren")

year_cols <- names(data)[7:ncol(data)]  # This selects columns from the 7th to the last one

# Pivot the data to long format, ensuring we only select the numeric year columns
data_long <- data %>% 
  pivot_longer(cols = -c(GeoFIPS, GeoName, Region, TableName, IndustryClassification, Description, Unit), 
               names_to = "Year", 
               values_to = "Amount", 
               names_prefix = "X") %>%
  unite("Category", Description, Unit, sep = " ") %>%
  pivot_wider(names_from = Category, values_from = Amount) %>%
  mutate(GeoName = str_replace(GeoName, ", MI", "")) %>%
  filter(GeoName %in% michiganCounties) %>%
  filter(Year != "LineCode") %>%
  filter(Year > 1989) %>%
  mutate(State = "MI")%>%
  rename(
    PersonalIncome = `Personal income (thousands of dollars) Thousands of dollars`,
    Population = `Population (persons) 1/ Number of persons`,
    PerCapitaIncome = `Per capita personal income (dollars) 2/ Dollars`
  )

OHdata_long <- ohData %>% 
  pivot_longer(cols = -c(GeoFIPS, GeoName, Region, TableName, IndustryClassification, Description, Unit), 
               names_to = "Year", 
               values_to = "Amount", 
               names_prefix = "X") %>%
  unite("Category", Description, Unit, sep = " ") %>%
  pivot_wider(names_from = Category, values_from = Amount)%>%
  mutate(GeoName = str_replace(GeoName, ", OH", "")) %>%
  filter(GeoName %in% ohioCounties) %>%
  filter(Year != "LineCode") %>%
  filter(Year > 1989) %>%
  mutate(State = "OH")%>%
  rename(
    PersonalIncome = `Personal income (thousands of dollars) Thousands of dollars`,
    Population = `Population (persons) 1/ Number of persons`,
    PerCapitaIncome = `Per capita personal income (dollars) 2/ Dollars`
  )

MNdata_long <- mnData %>% 
  pivot_longer(cols = -c(GeoFIPS, GeoName, Region, TableName, IndustryClassification, Description, Unit), 
               names_to = "Year", 
               values_to = "Amount", 
               names_prefix = "X") %>%
  unite("Category", Description, Unit, sep = " ") %>%
  pivot_wider(names_from = Category, values_from = Amount)%>%
  mutate(GeoName = str_replace(GeoName, ", MN", "")) %>%
  filter(GeoName %in% minnesotaCounties) %>%
  filter(Year != "LineCode") %>%
  filter(Year > 1989) %>%
  mutate(State = "MN") %>%
  rename(
    PersonalIncome = `Personal income (thousands of dollars) Thousands of dollars`,
    Population = `Population (persons) 1/ Number of persons`,
    PerCapitaIncome = `Per capita personal income (dollars) 2/ Dollars`
  )

incomeData = bind_rows(data_long, OHdata_long, MNdata_long)

save(incomeData, file = "IncomeByCounty1990_2020.RData")


