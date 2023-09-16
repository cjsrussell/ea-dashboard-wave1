# -------------------- OWN THE LIBS -------------------------------------

library(shiny)
library(shinydashboard)
library(tidyverse)
library(fontawesome) #for theming
library(fresh)       #for theming
library(ggside)      #for side density plots
library(gt)          #for GT tables
library(gtsummary)   #for GT tables
library(kableExtra)  #for kable tables
library(corrplot)    #for correlation matrix plot








#--------------------- Theme ----------------------------------

mytheme <- create_theme(
  adminlte_color(
    light_blue = "#253f8c", 
    yellow = "#8fb9ca" ),
  
  adminlte_sidebar(
    width = "250px",
    dark_bg = "#FFFFFF",
    dark_hover_bg = "#FFFFFF",
    dark_color = "#FF0000"
  ),
  
  adminlte_global(
    content_bg = "#FFFFFF",
    box_bg = "#FFFFFF", 
    info_box_bg = "#8fb9ca"
    
  )
)

#####--------------------- Call Data Files ----------------------------------

# Survey 1

data1 <- read.csv("data_s1.csv")

data1$rid <- factor(data1$rid, levels = c(0, 1), labels = c("no", "yes"))

data1$fnation <- factor(data1$fnation)

data1$fsex <- factor(data1$fsex)

data1$fissp_01 <- factor(data1$fissp_01)

data1$fissp_02 <- factor(data1$fissp_02)

data1$fsnb_16 <- factor(data1$fsnb_16)

data1$fsnb_17 <- factor(data1$fsnb_17)

# relabel columns

data1 <- data1 %>%
  rename(
    
    "Age" = age, 
    "Sex" = fsex, 
    "Country" = fnation,
    
    "Individualism" = indivcollect,
    "Rebelliousness" = rebel,
    "Choice Norms" = indivchoice,
    
    
    "Belief In God (categorical)" = fissp_01,
    "Belief Identity" = fissp_02,
    
    "Belief in God (continuous)" =  belief_01,
    "Possibility of Knowing" = belief_02,
    "Confidence in Belief" = conf_01, 
    "Anti Religiosity" = ar_01, 
    "God Apatheism" = apth_01, 
    "Purpose Apatheism" = apth_02,
    "Agnosticism" = agn_01,
    "Objective Truth Discovery" = mean_01,
    
    
    "Religious Identification (y/n)" = rid,
    "Religious Identity" = frid_02,
    
    "Religious Attendence" = rp_01, 
    "Prayer Frequency" = rp_02, 
    "Religious Artefacts" = rp_03,
    
    "Life After Death" = snb_01, 
    "Reincarnation" = snb_02, 
    "Astrology" = snb_03, 
    "Mystical Powers (people)" = snb_04, 
    "Mystical Powers (objects)" = snb_05, 
    "Good and Evil Powers" = snb_06, 
    "Universal Life Force" = snb_07, 
    "Karma" = snb_08, 
    "Fate" = snb_09, 
    "Supernatural Beings" = snb_10, 
    "Good Supernatural Beings" = snb_11,
    "Harmful Supernatural Beings" = snb_12, 
    "Afterlife Punishment" = snb_13, 
    "Afterlife Reward" = snb_14, 
    "Evil Eye" = snb_15, 
    "Spiritual Force" = fsnb_16, 
    "Lucky/Protection Objects" = fsnb_17
  )


#--------------------- LOAD FUNCTIONS ----------------------------------

source("funs_s1.R")
