# Testing
library(testthat)


# Provides the print_directory function
source(r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\Print directory.R)")
source(r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\File statistics visualizer.R)")

# File type identification testing
test_that("pdf", expect_equal(find_file_type("file.pdf"), "pdf"))
test_that("docx", expect_equal(find_file_type("word.docx"), "docx"))
test_that("md", expect_equal(find_file_type(
  r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\README.md)"), "md"))
test_that("Lowercase r", expect_equal(find_file_type(
  r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\Test_Harness.R)"), "r"))
test_that("gitignore", expect_equal(find_file_type(
  r"(C:\Users\leewa\Documents\Important documents\Computer Science\Digital-Signal-Processor\.gitignore)"), "gitignore"))
test_that("File type of files with more than 1 period", expect_equal(find_file_type(
  r"(C:\Users\leewa\Documents\Important documents\Computer Science\Digital-Signal-Processor\Digital-Signal-Processor.vcxproj.user)"),
  "vcxproj.user"))
test_that("No file type", expect_equal(find_file_type("none"), "No file type"))


# Data frame frequency testing
# Data frame that holds the counts of each file type
file_frequency_data_frame <- data.frame(
  file_type <- c(),
  frequency <- c(),
  stringsAsFactors = FALSE
)

test_that("Empty file_type vector", expect_equal(length(file_frequency_data_frame$file_type) == 0, TRUE))
test_that("Empty frequency vector", expect_equal(length(file_frequency_data_frame$frequency) == 0, TRUE))
file_frequency_data_frame = add_file_type_to_data_frame("pdf", file_frequency_data_frame)
test_that("1 pdf in DF", expect_equal(file_frequency_data_frame$file_type[1], "pdf"))

print_directory_driver()
cat('\014')  # Clear console
rm(list = ls())  # Clear variables
