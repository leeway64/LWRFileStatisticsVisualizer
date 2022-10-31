library(here)
source(here("src", "print-directory.R"))


if (is.null(box::name()))
{
    print_directory_driver()
}
