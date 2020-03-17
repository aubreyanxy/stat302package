test_that("multiplication works", {
  data(mtcars)
  expect_false(my_lm(mpg ~ hp + wt,data=mtcars)[1,1][1] == '')
})
