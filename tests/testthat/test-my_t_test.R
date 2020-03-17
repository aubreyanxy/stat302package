test_that("multiplication works", {
  seed(1)
  test_data <- rnorm(10, mean = 1, sd = 2)
  expect_match(my_t.test(test_data, 2, alternative = "less" )[1], '$test_stat = -1.49')
})
