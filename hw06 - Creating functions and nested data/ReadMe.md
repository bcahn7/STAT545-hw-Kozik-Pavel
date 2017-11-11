### Homework 6 STAT 545

Here is a [link to homework 6](https://github.com/Kozp/STAT545-hw-Kozik-Pavel/blob/Side-Branch/hw06%20-%20Creating%20functions%20and%20x/hw06.md) concerning the creation of functions and working with nested data frames. Here is the associated [rmd file](https://github.com/Kozp/STAT545-hw-Kozik-Pavel/blob/Side-Branch/hw06%20-%20Creating%20functions%20and%20x/hw06.Rmd) for those interested.

### Progpress Report

One difficult aspect of the assignment was simply the time elapsed since the past 545 assignment. Material leaves memory quicky and I found myself often realizing I knew a function existed, or I knew that a certain operation was possible, but not the exact steps needed achieve my goal. To that extent, having older code was useful as a refresher. 

The course [website page](http://stat545.com/block024_group-nest-split-map.html) on nested data was key to completing the assignment. A question I ran into here, although individual tibbles could be called on by their country number, often we will know the country we are after but not its respective number. Using the *which* function was of value as I could instead refer to countries by name. 

Another issue was when creating a quadratic term, the presence of NAs resulted in errors. However, by removing these values early on in the first few steps of the assignment this seemed to alleviate the problem. Although in the future more nuanced ways of handling missing data could be implemented and functions created.

One thing I was curious on was how one could automate interaction based regressions. I would assume this would require four variables: The criterion, both predictors, and their interaction. The code would seem to operate as follows:

Interaction_Reg <- function(x, y, z) {
  Criterion <- na.omit(x)
  Predictor1 <- na.omit(y)
  Predictor2 <- na.omit(z)
  Interaction <- y*z
  the_fit <- lm(Criterion ~ Predictor + Predictor2 + Interaction)
  summary(the_fit)
}

Although I had not the time to more reasonably test this. Perhaps then in a future assignment.