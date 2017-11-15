#Master Script
setwd("C:/Users/Pavel/Desktop/STAT545-hw-Kozik-Pavel/hw07 - Scripts and Make")
source("Script1_Download.R")
source("Script2_DataCleaning_and_prep.R")
source("Script3_Visualization.R")
rmarkdown::render('Script4_Report.Rmd')

