test_that("multiplication works", {
  library(tidyverse)
  library(class)
  library(randomForest)
  data("iris")
  set.seed(302)

  kk <- my_rf_cv(5)
  except_equal(kk, 0.132636682265531)
})
