#Data Visualization#

#Load relevant library
library(ggplot2)
library(dplyr)
library(forcats)

Vancouver_Age_Long <- readRDS(file="Vancouver_Age_Long.rds")
Vancouver_MF_Long <- readRDS(file="Vancouver_MF_Long.rds")

#Set preferred theme aesthetic.
a_theme = theme(panel.grid.major = element_blank(), 
				panel.grid.minor = element_blank(), 
				panel.background = element_blank(), 
				legend.key = element_blank(),
				axis.line = element_line(color = "black"))

#Map the population of different neighborhoods
Vancouver_Age_Long %>%
	filter(CityRegion != "CMA of Vancouver" & CityRegion != "Vancouver CSD (City)") %>%
	ggplot(aes(y = Population, x = reorder(CityRegion, Population))) +
	stat_summary(fun.y = sum, geom = "point") +
	xlab(" ")+
	ggtitle("Population Size of Vancouver Neighborhoods")+
	theme(plot.title = element_text(size = 9, hjust = 0.5)) +
	theme(axis.title=element_text(size=9)) +
	scale_y_continuous(expand= c(0,0), breaks=seq(0,60000,10000), lim = c(0,60500)) +  #Set y axis range
	theme(axis.text.x = element_text(angle=90,hjust=1, vjust=.2, size = 8)) +
	a_theme 

#Save the result for later Rmarkdown
ggsave("Vancouver_Pop_By_Region.png", dpi = 600,  height = 5, width = 6)

#Population by Age Group
Vancouver_Age_Long %>%
	filter(CityRegion != "CMA of Vancouver" & CityRegion != "Vancouver CSD (City)") %>%
	ggplot(aes(y = Population, x = reorder(Age, Population))) +
	xlab(" ")+
	stat_summary(fun.y = sum, geom = "point") +
	ggtitle("Population Size of Different Age Groups in Vancouver")+
	theme(plot.title = element_text(size = 9, hjust = 0.5)) +
	theme(axis.title=element_text(size=9)) +
	scale_y_continuous(expand= c(0,0), breaks=seq(0,60000,10000), lim = c(0,60500)) +  #Set y axis range
	theme(axis.text.x = element_text(angle=90,hjust=1, vjust=.2, size = 8)) +
	a_theme 


ggsave("Vancouver_Pop_By_Age.png", dpi = 600, height = 5, width = 6)


NewLevels <- fct_collapse(Vancouver_Age_Long$Age, Younger = c("0 to 4 years","5 to 9 years","10 to 14 years", "15 to 19 years", 
															  "20 to 24 years", "25 to 29 years"), 
						  Middle = c("30 to 34 years", "35 to 39 years", "40 to 44 years",
						  		   "45 to 49 years", "50 to 54 years", "55 to 59 years"),
						  Older = c("60 to 64 years", "65 to 69 years", "70 to 74 years",
						  		  "75 to 79 years", "80 to 84 years", "85 years and over"))

Vancouver_Age_Long$Age_Split <- NewLevels


Vancouver_Age_Long %>%
	filter(CityRegion != "CMA of Vancouver" & CityRegion != "Vancouver CSD (City)") %>%
	ggplot(aes(y = Population, x = reorder(CityRegion, Population), group = Age_Split)) +
	theme(axis.text.x = element_text(angle=90,hjust=1, vjust=.2, size = 8)) +
	xlab(" ")+
	theme(legend.title=element_blank(), #no legend title
		  legend.position=c(.15,.85)) +
	stat_smooth(aes(color=Age_Split), span = .95, se = FALSE)+
	stat_summary(aes(color = Age_Split),fun.y = mean, geom = "point") +
	ggtitle("Young, Middle, and Old Age Group \n Populations in Vancouver Neighborhoods")+
	theme(plot.title = element_text(size = 9, hjust = 0.5)) +
	theme(axis.title=element_text(size=9)) +
	scale_color_manual(values=c("cornflowerblue", "coral3", "green"), name = "Age")+ #Select colors I like
	a_theme 

ggsave("Vancouver_Age_Split.png", dpi = 600, height = 5, width = 6)


Vancouver_MF_Long %>%
	filter(CityRegion != "CMA of Vancouver" & CityRegion != "Vancouver CSD (City)") %>%
	ggplot(aes(y = Population, x = CityRegion, group = Sex)) +
	geom_point(aes(color = Sex)) +
	xlab(" ")+
	ggtitle("Population of Males and \n Females in Vancouver Neighborhoods")+
	theme(plot.title = element_text(size = 9, hjust = 0.5)) +
	theme(axis.title=element_text(size=9)) +
	theme(legend.title=element_blank()) + #No legend title
	scale_color_manual(values=c("cornflowerblue", "coral3"), name = "Sex", labels=c("Female","Male"))+ #Select colors I like
	theme(axis.text.x = element_text(angle=90,hjust=1, vjust=.2, size = 8)) +
	a_theme

ggsave("MF_Split.png", dpi = 600, height = 5, width = 6)
