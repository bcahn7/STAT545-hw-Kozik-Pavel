### Homework 5 STAT 545

Here is a [link to homework 6]() concerning the creation of functions and working with nested data frames. Here is the associated [rmd file](https://github.com/Kozp/STAT545-hw-Kozik-Pavel/blob/Side-Branch/hw05%20-%20Novel%20colors%20and%20brewer%2C%20refactoring%2C%20ggsave%20and%20improving%20figure%20quality/hw5.Rmd) for those interested.

### Progpress Report

One difficult aspect of the assignment was simply having taken a break before he past 545 assignment. It is surprising how quickly material is left from memory. I found myself often realizing I knew a function existed, or I knew that a certain operation was possible, but not the exact steps needed achieve my goal. To that extent, having older code was useful as a refresher. 

The course [website page](http://stat545.com/block024_group-nest-split-map.html) on nested data was key to completing the assignment. A question I ran into here, although individual tibbles could be collected by referring to the country number, often we will know the country we are after but not its respective indexing number. Using the *which* function here would be of great value in such cases. In my own analysis I made use of this as such.

Another issue was when creating a quadratic term, the presence of NAs resulted in errors. However, by removing these values early on in the first few steps of the assignment this seemed to alleviate the problem, although in the future more nuanced ways of handling missing data could be implemented,

One thing I was curious on was how one could automate interaction based regressions. I would assume this would require four variables: The criterion, both predictors, and their interaction. The code would seem to operate as follows:

Interaction_Reg <- function(x, y, z) {
  Criterion <- na.omit(x)
  Predictor1 <- na.omit(y)
  Predictor2 <- na.omit(z)
  Interaction <- y*z
  the_fit <- lm(Criterion ~ Predictor + Predictor2 + Interaction)
  summary(the_fit)
}

Although I had not the time to more reasonably test this.