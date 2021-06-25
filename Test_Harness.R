# Testing
library(testthat)


# Provides the print_directory function
source(r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\Print directory.R)")
source(r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\File statistics visualizer.R)")

# File type testing
test_that("pdf", expect_equal(find_file_type("file.pdf"), "pdf"))
test_that("docx", expect_equal(find_file_type("word.docx"), "docx"))
test_that("md", expect_equal(find_file_type(r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\README.md)"), "md"))

test_that("No file type", expect_equal(find_file_type("none"), "No file type"))


cat('\014')  # Clear console
rm(list = ls())  # Clear variables
