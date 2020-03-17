test_that("multiplication works", {
  library(tidyverse)
  library(class)
  library(randomForest)
  data("iris")
  set.seed(302)

  res1 <- my_knn_cv(train = iris[, -5], k_cv = 5,k_nn = 1,cl = iris$Species)
  res1_mean <- mean(res1[[2]])

  expect_equal(res1_mean, 0.0397185598377282)
})
