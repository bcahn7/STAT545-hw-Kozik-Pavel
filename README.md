# STAT545-hw01-Kozik-Pavel


---
title: "Homework 1: Life Expectacy"
output: html_document
---


This repository was created by Pavel Kozik to complete the first [**STATS 545**](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf) homework assignment. 

In this assignment we will be looking at the [**gapminder**](https://cran.r-project.org/web/packages/gapminder/index.html) data set in which *life expectancy* was measured from the early *1950s to 2007*. 

<center> <h3>Life Expectacy Over Decades </h3> </center>

```{r, message=FALSE, warning=FALSE, echo = FALSE, fig.align="center"}
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
    ylab("Life Expectancy") +
    coord_cartesian(ylim = c(40,80), xlim = c(1952,2007))+
    scale_y_continuous(breaks=seq(40,80,5)) +
    scale_x_continuous(breaks=seq(1952,2007,5)) +
    theme(axis.text.x = element_text(colour="grey20",size=12,angle=0,face="plain"),
        axis.text.y = element_text(colour="grey20",size=12,angle=0,face="plain"),  
        axis.title.x = element_text(colour="grey20",size=15,angle=0,face="plain"),
        axis.title.y = element_text(colour="grey20",size=15,angle=90,face="plain"))
```

&nbsp;
&nbsp;
&nbsp;
&nbsp;

As we can see life expectancy has increased by roughly 15 years since study onset.

&nbsp;

A more nuanced distinction however may be made by considering the growth rates of different *continents*. 

&nbsp;
&nbsp;

<center> <h3>Life Expectacy Across Continents</h3> </center>

```{r, message=FALSE, warning=FALSE, echo = FALSE, fig.align="center"}
LifeByYear2 = ggplot(gp, aes(year, lifeExp, group = Continent)) + removal

LifeByYear2  +
  stat_summary(fun.data = mean_se , geom = "errorbar", width = 2) +
  stat_summary(fun.y = mean, geom = "line", aes(group = Continent, color = Continent), size = 1.25) +
  xlab("Year") +
  ylab("Life Expectancy") +
  coord_cartesian(ylim = c(40,80), xlim = c(1952,2007))+
  scale_y_continuous(breaks=seq(40,80,5)) +
  scale_x_continuous(breaks=seq(1952,2007,5)) +
  theme(axis.text.x = element_text(colour="grey20",size=12,angle=0,face="plain"),
        axis.text.y = element_text(colour="grey20",size=12,angle=0,face="plain"),  
        axis.title.x = element_text(colour="grey20",size=15,angle=0,face="plain"),
        axis.title.y = element_text(colour="grey20",size=15,angle=90,face="plain"))
```

&nbsp;
&nbsp;
&nbsp;
&nbsp;

Visually a trend seems apparent. Continents like Asia and America had a larger increase in life expectancy than did Europe and Oceania. Thus while life expectacy has increased the most noticable difference seems to be in continents that started with a lower life expectancy.

&nbsp;
&nbsp;


|    **Continent**    | **Mean Life Expectacy in 1952** | **Mean Life Expectancy in 2007 **| **Life Expectancy Increase**| **Relative ranking**
  |----|---------------|---------------|--------------|------------|-|
  |Africa          | 39.14 |54.81| 15.67|3|
  |Americas        | 53.28 |73.81| 20.53|2|
  |Asia            | 46.31 |70.73|24.42|1|
  |Europe          | 64.41 |77.65|13.24|4|
  |Oceania         | 69.26 |80.72|11.46|5|


&nbsp;
&nbsp;

Somewhat puzzling to this interpretation however is that Africa although having the lowest life expectancy only showed intermediate increase. One notable difference is that unlike the other continents, Africa did not have nearly as pronounced an increase in *gross domestic product (GDP)* over the years. 

&nbsp;
&nbsp;

<center> <h3>GDP Across Continents</h3> </center>

```{r, message=FALSE, warning=FALSE, echo = FALSE, fig.align="center"}
GDPByYear = ggplot(gp, aes(year, gdpPercap, group = Continent)) + removal

GDPByYear  +
  stat_summary(fun.y = mean, geom = "line", aes(group = Continent, color = Continent), size = 1.25) +
  xlab("Year") +
  ylab("GDP (per capita)") +
  coord_cartesian(ylim = c(0,35000), xlim = c(1952,2007))+
  scale_y_continuous(breaks=seq(0,35000,5000)) +
  scale_x_continuous(breaks=seq(1952,2007,5)) +
  theme(axis.text.x = element_text(colour="grey20",size=12,angle=0,face="plain"),
        axis.text.y = element_text(colour="grey20",size=12,angle=0,face="plain"),  
        axis.title.x = element_text(colour="grey20",size=15,angle=0,face="plain"),
        axis.title.y = element_text(colour="grey20",size=15,angle=90,face="plain"))
```
&nbsp;

***note***. Error bars were not included to avoid an overly cluttered figure.
&nbsp;
&nbsp;

Whether this halted progression may in part be influencing life expectancy rate in Africa would seem a tenable notion. 

&nbsp;

According to more recent 2016 statisics provided by the [**International Monetary Fund**](http://www.imf.org/external/datamapper/NGDPD@WEO/OEMDC/ADVEC/WEOWORLD/AFQ) Africa currently has a GDP of 2.18, a value comparable to the above figure. Whether or not Africa has in turn had an increase in life expectancy would be worth considering.

<center>![](http://stat545.com/static/img/stat545-logo-s.png)</center>



