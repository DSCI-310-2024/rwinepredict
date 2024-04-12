# rwinepredict

The goal of rwinepredict is to provide functions that help with the data analysis of explore the predictive relationships between the physicochemical properties of wine and its quality using wine data.

# Contributors
- Felix Li
- Gurman Gill
- Dia Zavery
- Steve He


# Functions

- **clean_data.R**: Performs data cleaning and preprocessing on the wine dataset. It drops N/A values, converts the target column to a factor, and scales numeric columns.
- **distribution_bar.R**: A function for generating a bar for the distribution of a variable based on its frequency
- **quality.R**: This function transforms the 'quality' column in a dataframe to categorical values "bad" or "good".
- **scatter_plot.R**: Function to plot a scatter plot

# Place within the R Package Ecosystem
**rwinepredict** may initially appear to overlap with functionalities of established R packages like `ggplot2` or `dplyr`. However, it differentiates itself by tailoring each function to the specific nuances of wine quality analysis, enhancing both usability and relevance for our specific data sets.

While **rwinepredict** includes visualization functions similar to those in `ggplot2`, such as `distribution_bar` and `scatter_plot`, these are customized with predefined settings optimized for wine data. For example, `scatter_plot` automatically adjusts plot dimensions and aesthetics to best display the relationship between physicochemical properties and wine quality, making the visualizations immediately useful and appealing for our analysis context.

The `clean_data` function goes beyond the basic capabilities of `dplyr`'s `select` and `filter`. It integrates multiple data cleaning steps essential for preparing wine data for analysis, such as converting the quality scores from a numeric to a binary scale which directly supports the project's focus on classifying wine quality.

The `quality` function specifically caters to the wine industry's standards by transforming the numeric quality ratings into practical categories ("bad" or "good"). This directly aligns with industry practices where such categorizations significantly influence production and marketing strategies.

Each function in **rwinepredict** is designed to work cohesively within the package's ecosystem. This seamless integration facilitates a more efficient analysis workflow, where data cleaning, transformation, and visualization are not just isolated tasks but interconnected steps that enhance the overall analytical output

# Installation
```
# install.packages("devtools")
devtools::install_github("DSCI-310-2024/rwinepredict")
```

# Usage

The rwinepredict package offers a suite of functions tailored to facilitate the analysis of wine data, focusing on cleaning, visualization, and transformation. Here is how you can use these functions effectively:

### Cleaning Wine Dataset
The clean_wine_data function preprocesses your wine dataset by removing N/A values, converting the target column to a factor, and scaling numeric columns, preparing it for further analysis.

```
# Load data
data <- read.csv('wine_data.csv', header = TRUE, sep = ";")
# Clean data
cleaned_data <- clean_wine_data(data, target_col = 'quality')
```

### Distribution Plot
The distribution_bar function creates a bar chart to visualize the distribution of a specified variable based on its frequency. This function is ideal for understanding the frequency distribution of variables like wine quality or pH levels.

```
# Plot distribution of a variable
dist_plot <- distribution_bar(cleaned_data, "quality", title = "Distribution of Wine Quality", x_label = "Quality", y_label = "Frequency")
print(dist_plot)
```

### Transform Quality Values
The quality function categorizes the 'quality' column into 'bad' and 'good' based on predefined thresholds. This transformation is useful for simplifying the quality assessment process.

```
# Transform quality ratings
transformed_data <- quality(cleaned_data)
```

### Scatter Plot
The scatter_plot function plots a scatter plot to visualize the relationship between two variables. This function includes aesthetic customizations and a reference line to aid in visual comparisons.

```
# Create a scatter plot
scatter_plot_data <- scatter_plot(transformed_data, "alcohol", "quality", title = "Alcohol vs. Quality", x_label = "Alcohol Content", y_label = "Quality")
print(scatter_plot_data)
```

These functions are designed to work seamlessly with typical R workflows, enhancing the analysis of wine data by addressing specific needs such as preprocessing, visualization, and categorical transformation.

# Contributing
Do you want to contribute to our package? Check out the contributing guidelines. Please note that this project is released with a Code of Conduct. By contributing to this project, you agree to abide by its terms.

# License
This project is licensed under the following:

- [MIT License](./LICENSE.md). - contained in `LICENSE.md`

_Please refer to `LICENSE.md` for detailed licensing information._
