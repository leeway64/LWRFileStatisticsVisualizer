library(here)
source(here("src", "LWRFileStatisticsVisualizer.R"))


# Similar to __name__ == "__main__" in Python
if (is.null(box::name()))
{
    file_statistics_visualizer()
}
