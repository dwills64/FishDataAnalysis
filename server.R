library(shiny)
library(ggplot2)
require(readr)
library(tidyverse)
library(leaflet)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)
library(data.table)
library(sp)
library(rgdal)
fishdat <- read_csv("data/OHRFP.csv")
api_key <- "5f7f921d195342b5e0bf5f49ea0a84dd"
secret <- "149c50013e337ef9"
user_id <- "194067808@N08"




function(input, output, session) {
  coordinate <- read_csv("data/coordinate.csv")
  coordinate <- data.frame(cord)
  coordinate$Location <-  as.character(coordinate$Location)
  row.names(coordinate) <- coordinate$Location
  coordinate$Latitude <-  as.numeric(coordinate$Latitude)
  coordinate$Longitude <-  as.numeric(coordinate$Longitude)

  updateSelectInput(session, "areaSelection",
                    choices = rownames(coordinate %>% select(Location)))
  
  output$areaName <- renderPrint({
    ifelse(input$areaSelection == coordinate$Location, input$areaSelection, input$areaSelection)
    output$latitude <- renderPrint(input$Latitude)
    output$longitude <-renderPrint(input$Longitude)
  })
  
  output$data = DT::renderDataTable(coordinate)
    
  
  flickr.photos.search <- function(api_key, bbox=NULL, extras=c("geo","tags","date_taken","url_m"), output="metadata",.allpages=FALSE, .usecache=TRUE, ...) {
    if(missing(api_key)) {
      api_key <- "5f7f921d195342b5e0bf5f49ea0a84dd"
      message("api key successfully used")
    }
  }
  
  "
  photos <- flickr.photos.search(
    bbox=coordbounds, 
    text=Photo from Coordinate
    .allpages=TRUE)
 
  "

}


  


  
