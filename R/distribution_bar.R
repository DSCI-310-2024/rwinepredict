#' Distribution Plot
#'
#' A function for generating a bar for the distribution of a variable based
#' on its frequency,
#'
#' @param data data_frame A data frame or a tibble.
#' @param x unquoted column name to plot on the x-axis from data data_frame or tibble
#'
#' @return A ggplot object
#' @importFrom ggplot2 ggplot
#' @export
#'
distribution_bar <- function(data, x, title = NULL, x_label = NULL, y_label = NULL) {
  dist <- ggplot(data, aes_string(x = x)) +
    geom_bar(fill = "steelblue", color = "black") +
    labs(title = title, x = x_label, y = y_label)

  return(dist)
}
