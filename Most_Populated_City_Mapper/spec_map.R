#THIS R FILE RUNS WHEN YOU ENTER AN EXISTING COUNTRY

i <- 0
index <- 0

#WE SEARCH FOR THE COUNTRY'S #
for(name1 in country_names$name){
  i <- i+1
  if(name1 == searched_country){
    index <- i
  }
}

#SAVING DATA ABOUT THE CITY
searched_city <- country_names[[index,2]]
searched_max <- country_names[[index,3]]
searched_long <- country_names[[index,4]]
searched_lat <- country_names[[index,5]]

#MAP USING THE DATA FROM YOUR INPUT AND OUR DATAFRAMES
m <- leaflet(data=country_names) %>%
  setView(lng = searched_lat, lat = searched_long, zoom = 6)
m %>%
  addTiles() %>% addMarkers(popup = paste("Name of country: ", country_names$name, "<br>",
                                          "Name of city: ", country_names$city_name, "<br>",
                                          "Population:", country_names$max_pop, "<br>"))