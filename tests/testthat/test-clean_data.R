library(dplyr)
library(tidyr)
library(tibble)

test_that("NA values are removed", {
  data_with_na <- tibble(
    acidity = c(7, NA, 6.7),
    quality = c(5, 6, NA)
  )
  result <- clean_wine_data(data_with_na, target_col = 'quality')
  if (sum(is.na(result)) > 0) {
    print(which(is.na(result), arr.ind = TRUE))
  }
  expect_equal(sum(is.na(result)), 1)
})


test_that("Quality is converted to a factor", {
  data <- tibble(
    acidity = c(7, 7.4, 6.7),
    quality = 5:7
  )
  result <- clean_wine_data(data, target_col = 'quality')
  expect_is(result$quality, "factor")
})

test_that("Numeric columns are scaled", {
  data <- tibble(
    acidity = c(7, 7.4, 6.7),
    quality = 5:7
  )
  result <- clean_wine_data(data, target_col = 'quality')
  expected_scaled <- scale(data$acidity)
  expect_equal(result$acidity, expected_scaled)
})
