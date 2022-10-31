library(here)
source(here("src", "LWRFileStatisticsVisualizer.R"))


if (is.null(box::name()))
{
    file_statistics_visualizer()
}
