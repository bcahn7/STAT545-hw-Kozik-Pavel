library(gapminder)
library(ggplot2)

gp <- gapminder

removal = theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                panel.background = element_blank(), 
                legend.key = element_blank(),
                axis.line = element_line(color = "black"))

gp$Continent = factor(gp$continent)

LifeByYear = ggplot(gp, aes(year, lifeExp)) + removal
LifeByYear + stat_summary(fun.y = mean, geom = "point", size = 4) +
    stat_summary(fun.y = mean, geom = "line", size = 1.25) +
    stat_summary(fun.data = mean_se , geom = "errorbar", width = 2) +
    xlab("Year") +
    ylab("Population") +
    coord_cartesian(ylim = c(45,75))+
    scale_y_continuous(breaks=seq(45,75,5)) +
    theme(axis.text.x = element_text(colour="grey20",size=12,angle=0,face="plain"),
        axis.text.y = element_text(colour="grey20",size=12,angle=0,face="plain"),  
        axis.title.x = element_text(colour="grey20",size=15,angle=0,face="plain"),
        axis.title.y = element_text(colour="grey20",size=15,angle=90,face="plain"))


LifeByYear = ggplot(gp, aes(year, lifeExp, group = Continent)) + removal

LifeByYear  +
  stat_summary(fun.data = mean_se , geom = "errorbar", width = 2) +
  stat_summary(fun.y = mean, geom = "line", aes(group = Continent, color = Continent), size = 1.25) +
  xlab("Year") +
  ylab("Population") +
  coord_cartesian(ylim = c(40,80))+
  scale_y_continuous(breaks=seq(40,80,5)) +
  theme(axis.text.x = element_text(colour="grey20",size=12,angle=0,face="plain"),
        axis.text.y = element_text(colour="grey20",size=12,angle=0,face="plain"),  
        axis.title.x = element_text(colour="grey20",size=15,angle=0,face="plain"),
        axis.title.y = element_text(colour="grey20",size=15,angle=90,face="plain"))


|    **Continent**    | **Min Life Expectacy** | **Max Life Expectancy**| **Difference**| 
  |----------------|------------|------------|------------|------------|
  | Africa         | 39.61 | 76.42| 36.81|
  | Americas       | 60.92 |80.65| 19.73|
  | Asia           | 43.83 |82.60|38.77|
  |Europe          | 71.78 |81.76|9.98|
  |Oceania         | 80.20 |81.24|1.04|


