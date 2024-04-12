mock_data <- data.frame(quality = c(3, 4, 5, 6, 7))

test_that("Function returns correct type", {
  expect_type(quality(mock_data), "list")
})

test_that("Function transforms quality column correctly", {
  transformed_data <- quality(mock_data)
  expect_equal(transformed_data$quality[1], "bad")
  expect_equal(transformed_data$quality[4], "good")
})
