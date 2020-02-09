#THIS FILE RUNS WHEN THE MESSAGE BOX GETS THE FOLLOWING INPUT: "all"

#CLICK ON THE POP-UP TO CHECK THE INFORMATION GIVEN ABOUT THE CITIES

m <- leaflet(data=country_names) %>%
  setView(lng = -40, lat = 40, zoom = 1)
m %>%
  addTiles() %>% addMarkers(popup = paste("Name of country: ", country_names$name, "<br>",
                                          "Name of city: ", country_names$city_name, "<br>",
                                          "Population:", country_names$max_pop, "<br>"))
