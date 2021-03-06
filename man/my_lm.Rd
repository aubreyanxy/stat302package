% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_lm.R
\name{my_lm}
\alias{my_lm}
\title{Function: my_lm}
\usage{
my_lm(formula, data)
}
\description{
Return a table of information includes "Estimate","Std. Error","t value","Pr(>|t|)" in the form of table
           It's a brief combination of lm() and summary()
Input: regression formula, data frame
Output: A table includes related data
}
\examples{
my_lm(mpg ~ hp + wt, data = mtcars)
my_lm(mpg ~ hp + qsec + wt, data = mtcars)
}
