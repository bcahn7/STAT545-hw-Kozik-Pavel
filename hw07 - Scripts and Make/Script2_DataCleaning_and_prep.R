#Data cleaning, management and preparation#

#Load relevant library
library(dplyr)
library(readxl)

#Input is downloader script output
#Vancouver <- Output_Vancouver
#Inspect the data for any outstanding abnormality
#View(Vancouver)

Vancouver <- read_excel("Vancouver.xls")

#First three rows of the data are text describing the data structure, we can discard them
Vancouver_Data <- Vancouver[-c(1:3), ] #Remove the first 3 rows of the data set
head(Vancouver_Data) #See how the new data set looks

#The first row contains data names rather than variable values. We can shift this row to be column names.
my.names <- Vancouver_Data[1,]
colnames(Vancouver_Data) <- my.names
#Then remove the first row
Vancouver_Data2 <- Vancouver_Data[-c(1:1), ] 
head(Vancouver_Data2)

#Next, the first row of data appears to be a sum. For the time being however we are more interested in
#the individual components rather than an aggregation.

Vancouver_Data3 <- Vancouver_Data2[-c(1:1), ] 
head(Vancouver_Data3)

#Next the first column of our data set does not have a name, lets provide it one.
names(Vancouver_Data3)[1] <- "Age"


#One issue we must address concerns that some rows have duplicate or dependent information. 
head(Vancouver_Data3, n = 15)

#As we can see there is a variable called 15 to 19 years that is a sum of the next 5 rows (i.e. 15 years,
#16 years, etc.) For our sake we will only take 15 to 19 years.

Vancouver_Data4 <-Vancouver_Data3 %>%
	filter(Age == "0 to 4 years" |
		   	Age == "5 to 9 years" |
		   	Age == "10 to 14 years" |
		   	Age == "15 to 19 years" |
		   	Age == "20 to 24 years" |
		   	Age == "25 to 29 years" |
		   	Age == "30 to 34 years" |
		   	Age == "35 to 39 years" |
		   	Age == "40 to 44 years" |
		   	Age == "45 to 49 years" |
		   	Age == "50 to 54 years" |
		   	Age == "55 to 59 years" |
		   	Age == "60 to 64 years" |
		   	Age == "65 to 69 years" |
		   	Age == "70 to 74 years" |
		   	Age == "75 to 79 years" |
		   	Age == "80 to 84 years" |
		   	Age == "85 years and over")

#Now we can check our data set
head(Vancouver_Data4, n = 15)


#Notice that while we have our desired rows, the original data set was organized such that after
#population values, other statistics would be reported like medians for those same age ranges.

Vancouver_Data4$Age

#Hence the age ranges appears again. Since we are only interested in population values, we will 
#extract only those, and they compromise the first 18 rows of the data set. 

Vancouver_Age <- Vancouver_Data4[c(1:18), ] 
Vancouver_Age$Age

#One other piece of interesting information is sex was included in the data set. A row for males
#and a row for females. Since it is a fairly easy row to extract and could be interesting, 
#lets also grab it. We can use this to find out if males and females tend to occupy different
#city regions. 

Vancouver_MF <- Vancouver_Data3 %>%
	filter(Age == "Females, total" | Age == "Males, total")

names(Vancouver_MF)[1] <- "Sex"

head(Vancouver_MF)

#The next step to address, both data sets are currently in wide format. Rather then there being a 
#city region variable under which Arbutus, Downtown, Dunbar, etc are levels, each level instead
#is a seperate column. We can reorganize through the melt function. .

#Melt is part of the reshape 2 package.
library(reshape2)
Vancouver_Age_Long <- melt(Vancouver_Age, id.vars=c("Age"))
Vancouver_MF_Long <-melt(Vancouver_MF, id.vars=c("Sex"))

head(Vancouver_Age_Long)
head(Vancouver_MF_Long)

#Lets rename our variables so they reflect what they capture

names(Vancouver_Age_Long)[2:3] <- c("CityRegion", "Population")
names(Vancouver_MF_Long)[2:3] <- c("CityRegion", "Population")

head(Vancouver_Age_Long)
head(Vancouver_MF_Long)

#Lastly, our variable types are not as they should be. 

glimpse(Vancouver_Age_Long)
glimpse(Vancouver_MF_Long)

#In both data sets CityRegion is a factor. However, Age, Sex and Population are all characters. 
#Lets relabel them to reflect their contents.
Vancouver_Age_Long$Age <- as.factor(Vancouver_Age_Long$Age)
Vancouver_MF_Long$Sex <- as.factor(Vancouver_MF_Long$Sex)

Vancouver_Age_Long$Population <- as.numeric(Vancouver_Age_Long$Population)
Vancouver_MF_Long$Population <- as.numeric(Vancouver_MF_Long$Population)

glimpse(Vancouver_Age_Long)
glimpse(Vancouver_MF_Long)

#Lets clean up the intermediate variables of this process so they do not linger or pollute future
#scripts. We will spare only our output for the next script.

saveRDS(Vancouver_Age_Long, file="Vancouver_Age_Long.rds")
saveRDS(Vancouver_MF_Long, file="Vancouver_MF_Long.rds")


rm(my.names, Vancouver_MF, Vancouver, Vancouver_Age, Vancouver_Data,
   Vancouver_Data2,Vancouver_Data3, Vancouver_Data4)


