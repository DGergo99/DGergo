#READING EXCEL FILE
full_data <- read_excel("input/worldcities.xlsx")

#COLLECTS COUNTRY NAMES FROM FULL_DATA DF
country_names <- data.frame(name = unique(full_data$country))

#THIRD DATAFRAME, SO WE HAVE NO NEEDLESS INFORMATION
data2 <- full_data %>% transmute(
  co_name = I(country),
  ci_name = I(city),
  pop = as.numeric(full_data$population),
  lat = lat,
  lng = lng
)
data2 <- na.omit(data2)

#LISTS USED FOR COLLECTING INFORMATION
max_list <- list()
long_list <- list()
lat_list <- list()
city_list <- list()

#DOUBLE FOR LOOP WHICH CHECKS COUNTRY NAMES AND COLLECTS DATA ABOUT THEIR BIGGEST CITIES
for(name1 in country_names$name){
  
  city_max = 0
  i=0
  for(name2 in data2$co_name){
    i <- i+1
    if(name1 == name2){
      if(city_max < data2$pop[[i]]){
        city_max <- data2$pop[[i]]
        t_long <- data2$lng[[i]]
        t_lat <- data2$lat[[i]]
        t_city <- data2$ci_name[[i]]
      }
    }
  }
  
  max_list <- append(max_list, city_max)
  long_list <- append(long_list, t_long)
  lat_list <- append(lat_list, t_lat)
  city_list <- append(city_list, t_city)
  
}

#FINAL AND FULL DATAFRAME
country_names <- country_names %>% mutate(
  max_pop = max_list,
  city_name = city_list,
  lat = as.numeric(lat_list),
  long = as.numeric(long_list)
)
#GETS RID OF ROWS CONTAINING "0"
country_names <- filter(country_names, max_pop != 0)

number_of_runs <- 1