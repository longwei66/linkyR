## =============================================================================
##
##                      linkR
##
##      some tools to play with linky data
##
##      0. load config and librairies
##
## =============================================================================


## =============================================================================
##      0. load config and librairies
## =============================================================================
source('./conf/file-sources.R')
source('./R/core/load-libraries.R')



## =============================================================================
##      1. get data
## =============================================================================

## ----------------------
## list dishwasher files
## ----------------------
my.files <- paste0(dishwasher.url,"/",list.files(dishwasher.url))
## load files with fread and bind
dishwasher <- rbindlist(lapply(X = my.files, fread,
                               header = FALSE,
                               col.names = c("time","action")))

## ----------------------
## list location files
## ----------------------
my.files <- paste0(location.url,"/",list.files(location.url))
## load files with fread and bind
location <- rbindlist(lapply(X = my.files, fread,
                             header = FALSE,
                             col.names = c("time","blank","map.url","action","location")))

## ----------------------
## list weather files
## ----------------------
my.files <- paste0(weather.url,"/",list.files(weather.url))
## load files with fread and bind
weather <- rbindlist(lapply(X = my.files, fread))



## ----------------------
## list linky files
## ----------------------
my.files <- paste0(linky.url,"/",list.files(linky.url))
## load files with fread and bind
linky <- rbindlist(lapply(X = my.files, read.csv,
                          sep = ";",    
                          nrows = 1))
linky$file.url <- my.files
linky$Date.de.debut <- as.Date(strptime(linky$Date.de.debut, format = "%d/%m/%Y"))
linky$Date.de.fin <- as.Date(strptime(linky$Date.de.fin, format = "%d/%m/%Y"))
linky$nb.day <- linky$Date.de.fin - linky$Date.de.debut

