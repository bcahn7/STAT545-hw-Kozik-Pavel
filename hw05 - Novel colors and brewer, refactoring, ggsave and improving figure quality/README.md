### Homework 5 STAT 545

Here is a [link to homework 5](hhttps://github.com/Kozp/STAT545-hw-Kozik-Pavel/blob/Side-Branch/hw05%20-%20Novel%20colors%20and%20brewer%2C%20refactoring%2C%20ggsave%20and%20improving%20figure%20quality/hw5.md) in which gapminder data was refactored, organized, saved, plots created and modified to look nicer. If there is an interest, here is the associated [rmd file](https://github.com/Kozp/STAT545-hw-Kozik-Pavel/blob/Side-Branch/hw05%20-%20Novel%20colors%20and%20brewer%2C%20refactoring%2C%20ggsave%20and%20improving%20figure%20quality/hw5.Rmd) as well.

### Progpress Report

This homework assignment in numerous ways required the culmination of course topics. There was material relevant from the first, to the last lecture, and required considerable input from each. To that extent the project was timely in that knowledge from multiple different facets was required.

One difficult aspect was verifying that refactoring was being done as expected. To overcome this, I relied on filtering and summarizing functions to ensure both processes agreed. 

A few problems that were less obvious to overcome concerned the reading of files. I ultimately relied on read.csv because the summary output seemed in better order than the use of read_csv. The former seemed to better maintain how the data had been before it was saved and read, while the latter converted my continents into "characters" and did not seem to maintain their distinct individual levels.

Navigating the ggplot legend required considerable effort. Modifying and moving the legend seemed very limited. For instance, there was no simple way to add onto this legend my variable that measured mean overall life expectency. Instead this variable had to be added to the legend through annotations. Moving the legend itself was also difficult, since by default it appears outside of the plot, where, geoms and annotations cannot easily be added. Annotations to seem finicky in that they can be specified via absolute cordinates (e.g. x = 5) but not relative cordinates (e.g. x = 5% of plot size). 

Lastly and something I did not complete was the legend does not be default include all levels of year. The legend instead groups by decade. My next modification would be creating a legend in which every year (e.g. 1997, 2002, etc) was labelled and present.
