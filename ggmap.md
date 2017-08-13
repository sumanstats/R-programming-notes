## Using ggmap 

It is a package interfacing ggplot2 and RGoogleMaps.

There are two steps in making a map.
+ download raster data for the map with `get_map()`
+ plot with the `ggmap()` and overlay with layers 



Raster data is downloaded with:
* location of center 
* zoom factor: `3=continent, 10=city, 21=building`

Location specification can be done with:
* address OR
* `lon/lat` longitude and latitude 


maptype in `ggmap`:
* `satellite`
* `roadmap`
* `hybrid`

Geographic coordinates can be obtained with `geocode()` function.




Example:
```
library(ggmap)
site <- geocode("Pokhara")
Pokhara<- ggmap(get_map(location=site, source=google, zoom=10), extent="panel")
Pokhara

```
  
