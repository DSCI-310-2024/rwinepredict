#' Clean Wine Dataset
#'
#' Performs data cleaning and preprocessing on the wine dataset. It drops N/A values,
#' converts the target column to a factor, and scales numeric columns.
#' @param data A dataframe containing the wine dataset to be cleaned.
#' @param target_col The name of the target column to convert to a factor.
#' @return A dataframe of the cleaned and preprocessed wine dataset.
#' @export
#'
#' @examples
#' data <- read.csv('wine_data.csv', header = TRUE, sep = ";")
#' cleaned_data <- clean_wine_data(data, target_col = 'quality')

clean_wine_data <- function(data, target_col) {
  library(dplyr)
  library(tidyr)

  # Remove NA values and check the result
  data_no_na <- data %>%
    drop_na()

  # If this assertion fails, there are still NAs immediately after drop_na()
  stopifnot(sum(is.na(data_no_na)) == 0)

  cleaned_data <- data %>%
    drop_na() %>%
    mutate({{ target_col }} := factor({{ target_col }})) %>%
    mutate_if(is.numeric, scale)

  return(cleaned_data)
}
