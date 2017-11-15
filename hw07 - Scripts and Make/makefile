#Master Code

all:Script4_Report.md Vancouver_Pop_By_Region.png Vancouver_Pop_By_Age.png Vancouver_Age_Split.png MF_Split.png

Vancouver.xls: Script1_Download.R
	Rscript Script1_Download.R
	
Vancouver_MF_Long.rds Vancouver_Age_Long.rds: Vancouver.xls Script2_DataCleaning_and_prep.R
	Rscript Script2_DataCleaning_and_prep.R Vancouver.xls
	
Vancouver_Age_Split.png Vancouver_Pop_By_Region.png Vancouver_Pop_By_Age.png MF_Split.png: Vancouver_MF_Long.rds Vancouver_Age_Long.rds Script3_Visualization.R
	Rscript Script3_Visualization.R Vancouver_Age_Long.rds Vancouver_MF_Long.rds
	
Script4_Report.md: Vancouver_MF_Long.rds Vancouver_Age_Long.rds Script4_Report.Rmd
	Rscript -e "rmarkdown::render('Script4_Report.Rmd')" Vancouver_MF_Long.rds Vancouver_Age_Long.rds
	