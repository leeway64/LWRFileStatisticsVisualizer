library(here)
source(here("src", "print-directory.R"))


# Similar to __name__ == "__main__" in Python
if (is.null(box::name()))
{
    print_directory_driver()
}
