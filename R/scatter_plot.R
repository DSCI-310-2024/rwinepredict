#' Function to plot a scatter plot
#'
#' @param data A data frame containing the prediction results
#' @param x_var the x-axis chosen to make the plot
#' @param y_var the y-axis chosen to make the plot
#' @param x_label The name for the x-axis label
#' @param y_label The name for the y-axis label
#'
#' @return A ggplot object
#' @import ggplot2
#' @export

scatter_plot <- function(data, x_var, y_var, title = NULL, x_label = NULL, y_label = NULL) {
  plot <- ggplot(data, aes_string(x = x_var, y = y_var)) +
    geom_point(color = 'blue', alpha = 0.6) +
    geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "red") +
    labs(title = title, x = x_label, y = y_label) +
    theme_minimal()

  return(plot)
}
