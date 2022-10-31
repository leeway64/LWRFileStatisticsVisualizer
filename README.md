# File Statistics Visualizer

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/leeway64/LWRFileStatisticsVisualizer)


This project visualizes several statistics about the types of files inside a given directory; a bar
chart and pie chart are created to show the relative popularity of each file type.

![Bar chart](doc/Bar_chart.jpeg)

![Pie chart](doc/Pie_chart.jpeg)

As a bonus, this project also includes an extra program, `print-directory`, for printing out every
single file and subdirectory within a specific directory.


## Installation

Clone this repository onto your local machine:

```bash
git clone https://github.com/leeway64/LWRFileStatisticsVisualizer.git
R
renv::restore()
```

The `renv::restore()` command will install the required R libraries.


## LWRFileStatisticsVisualizer Example

```
R
source("bin/run-LWRFileStatisticsVisualizer.R")
Directory or file name: test

```

The root directory of LWRFileStatisticsVisualizer is the root directory of the
LWRFileStatisticsVisualizer project.

Note that, after you enter the R Console by running the `R` command, you should see a message
saying that `Project '~/software/LWRFileStatisticsVisualizer' loaded. [renv 0.16.0]`.


## print-directory Example

```bash
Rscript bin/run-print-directory.R 
Directory or file name: test/test-directory-1
test-directory-1 
    Subdir1 
        New Microsoft PowerPoint Presentation.pptx 
    Subdir2 
        New Microsoft Excel Worksheet.xlsx 
        SubdirA 
            New Microsoft Word Document.docx 
    test1.txt 
    test2.txt
```

Alternatively, you may also run the scripts in RStudio.


## Running Unit Tests

```bash
R
testthat::test_dir(here())

```

Ensure you enter the R Console before running the `testthat::test_dir` command.


## Third-Party Software

- [testthat](https://testthat.r-lib.org/) (MIT license): Unit testing framework.
- [here](https://here.r-lib.org/) (MIT License): Library for making file referencing easier.
- [renv](https://rstudio.github.io/renv/) (MIT License): Reproducible environment creation library;
let's your create environments similar to Python virtual environments.
- [dplyr](https://dplyr.tidyverse.org/) (MIT license): Data manipulation library.
- [stringr](https://stringr.tidyverse.org/) (MIT license): String manipulation library.
- [box](https://klmr.me/box/) (MIT License): Package to increase modularity of R code.
