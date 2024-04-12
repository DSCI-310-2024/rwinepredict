#' Transform quality values
#'
#' This function transforms the 'quality' column in a dataframe to categorical values "bad" or "good".
#'
#' @param data A dataframe containing a 'quality' column.
#'
#' @return The input dataframe with the 'quality' column transformed.
#' @export
#'
#' @examples
#' data <- data.frame(quality = c(3, 4, 5, 6, 7))
#' quality(data)
#'
quality <- function(data) {
  stopifnot("quality" %in% names(data))
  data$quality <- ifelse(data$quality <= 5, "bad", "good")
  return(data)
}
