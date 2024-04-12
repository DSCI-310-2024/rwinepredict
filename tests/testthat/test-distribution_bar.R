library(ggplot2)
library(testthat)
source("../../R/distribution_bar.R")

data <- data.frame(quality=seq(1, 10, length.out = 100))

test_that("check if the dist is a ggplot object", {
  expect_is(distribution_bar(data, "quality"), "ggplot")
})

test_that("check if the dist has custom titles", {
  expect_equal(distribution_bar(data, "quality", "Custom Title")$labels$title, "Custom Title")
})

test_that("dist should have custom labels", {
  expect_equal(distribution_bar(data, "quality", NULL, "Custom X Label")$labels$x, "Custom X Label")
  expect_equal(distribution_bar(data, "quality", NULL, NULL, "Custom Y Label")$labels$y, "Custom Y Label")
})

test_that("the bar plot should have default features", {
  # Generate the plot
  bar_plot <- distribution_bar(data, "quality")

  bar_layer_data <- ggplot2::layer_data(bar_plot, 1) # Assuming geom_bar is the first layer

  # Test if the fill is steelblue
  expect_equal(bar_layer_data$fill[1], "steelblue")

  # Test if the border color is black
  expect_equal(bar_layer_data$colour[1], "black")

  expect_true(all(bar_layer_data$fill == "steelblue"))
  expect_true(all(bar_layer_data$colour == "black"))
})
