## Homework 3 STAT 545

Here is a [link to homework 3](https://github.com/Kozp/STAT545-hw-Kozik-Pavel/blob/Side-Branch/hw03/hw3.md) in which gapminder data was explored largely through plots and dpyler. If there is an interest, here is the associated [rmd file](https://github.com/Kozp/STAT545-hw-Kozik-Pavel/blob/Side-Branch/hw03/hw3.Rmd) as well.

### Progress Report

*You’re encouraged to reflect on what was hard/easy, problems you solved, helpful tutorials you read, etc. Give credit to your sources, whether it’s a blog post, a fellow student, an online tutorial, etc.*

There was no single excruciatingly difficult problem in this weeks homework. Rather, there were many moderate sized hurdles spread throughout the project. As an example, moving the plot legend, renaming its title, creating it manually, and other such questions each took their own time to resolve. Similar questions were encountered throughout, as another example, testing summarize functions and which were or were not available. Standard deviations and quantiles for instance are easily called for using the summarize function, but standard errors must seemingly be calculated by the user. 

Often my first resource for unresolved questions was use of the *?*, e.g. ?coord_cartesian. Though this to was sometimes not informative, for instance, while ?coord_cartesian provides valuable information on that specific function, I think I've come to realize that this function is actually something of a sub-function to scale_y_continuous. There doesn't seem to be any reason then to use coord_cartesian over scale_y_continuous, yet this was mostly found through trial and error.

Sometimes I find that I am aware gglot or dplyer is capable of doing something, but do not recall the specific function on how to do so. This is often resolved through a quick internet search.

Useful resources otherwise were the course website page on basic data care [basic data care](http://stat545.com/block006_care-feeding-data.html), [ggplot themes](https://stat545.com/cm008-notes_and_exercises.html), both of Jenny's tutorials on dplyer [1](http://stat545.com/block009_dplyr-intro.html) [2](http://stat545.com/block010_dplyr-end-single-table.html) and [ggplot documentation](http://ggplot2.tidyverse.org/reference/).


