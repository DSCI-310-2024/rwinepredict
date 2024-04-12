# Create sample predictions data frame
predictions <- data.frame(.fitted = seq(1, 10, length.out = 100), quality = seq(1, 10, length.out = 100))

# Test cases
test_that("check if the plot is a ggplot object", {
  # Test if the function returns a ggplot object
  expect_is(scatter_plot(predictions, ".fitted", "quality"), "ggplot")
})

test_that("plot should have Custom Title", {
  # Test if the plot has correct title
  expect_equal(scatter_plot(predictions, ".fitted", "quality", "Custom Title")$labels$title, "Custom Title")
})

test_that("polt should have custom labels", {
  # Test if the plot has correct x-axis label
  expect_equal(scatter_plot(predictions, ".fitted", "quality", NULL, "Custom X Label")$labels$x, "Custom X Label")
  # Test if the plot has correct y-axis label
  expect_equal(scatter_plot(predictions, ".fitted", "quality", NULL, NULL, "Custom Y Label")$labels$y, "Custom Y Label")

})

test_that("the plot should have default features", {
  # Test if the color of dots is blue
  expect_equal(ggplot2::layer_data(scatter_plot(predictions, ".fitted", "quality"))$colour[1], "blue")
  expect_equal(ggplot2::layer_data(scatter_plot(predictions, ".fitted", "quality"))$colour[2], "blue")
  # Test if the alpha value of the dot is 0.6
  expect_equal(ggplot2::layer_data(scatter_plot(predictions, ".fitted", "quality"))$alpha[1], 0.6)
  expect_equal(ggplot2::layer_data(scatter_plot(predictions, ".fitted", "quality"))$alpha[2], 0.6)
})
