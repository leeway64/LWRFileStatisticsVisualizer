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

# Testing adding a file type to file frequency data frame
test_that("Empty file_type vector", expect_equal(length(file_frequency_data_frame$file_type) == 0, TRUE))
test_that("Empty frequency vector", expect_equal(length(file_frequency_data_frame$frequency) == 0, TRUE))

file_frequency_data_frame <- add_file_type_to_data_frame("pdf", file_frequency_data_frame)
test_that("1 pdf in DF", expect_equal(file_frequency_data_frame$file_type[1], "pdf"))
test_that("1 pdf in DF", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "pdf", 2], 1))

test_that("DF doesn't have docx", expect_equal(file_frequency_data_frame$file_type == "docx", FALSE))
file_frequency_data_frame <- add_file_type_to_data_frame("docx", file_frequency_data_frame)
test_that("1 docx in DF", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "docx", 2], 1))

file_frequency_data_frame <- add_file_type_to_data_frame("vcxproj.user", file_frequency_data_frame)
test_that("1 vcxproj.user in DF", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "vcxproj.user", 2], 1))

file_frequency_data_frame <- add_file_type_to_data_frame("vcxproj.user", file_frequency_data_frame)
test_that("2 vcxproj.users in DF", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "vcxproj.user", 2], 2))

file_frequency_data_frame <- add_file_type_to_data_frame("pdf", file_frequency_data_frame)
file_frequency_data_frame <- add_file_type_to_data_frame("pdf", file_frequency_data_frame)
test_that("3 pdfs in DF", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "pdf", 2], 3))


# Testing that the file frequency data frame has the correct counts of file types
file_frequency_data_frame <- data.frame(
  file_type <- c(),
  frequency <- c(),
  stringsAsFactors = FALSE
)
directory = r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\Test directory)"
file_frequency_data_frame <- get_file_statistics(directory, file_frequency_data_frame)
test_that("2 txt files", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "txt", 2], 2))
test_that("1 pptx file", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "pptx", 2], 1))
test_that("1 xlsx file", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "xlsx", 2], 1))
test_that("1 docx file", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "docx", 2], 1))
test_that("4 rows/file types in DF", expect_equal(nrow(file_frequency_data_frame), 4))


file_frequency_data_frame <- data.frame(
  file_type <- c(),
  frequency <- c(),
  stringsAsFactors = FALSE
)

# This directory contains no files or other directories
directory = r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\Test directory\Subdir2\SubdirB)"
file_frequency_data_frame <- get_file_statistics(directory, file_frequency_data_frame)
test_that("Empty file_type vector", expect_equal(length(file_frequency_data_frame$file_type) == 0, TRUE))
test_that("Empty frequency vector", expect_equal(length(file_frequency_data_frame$frequency) == 0, TRUE))
test_that("0 rows/file types in DF", expect_equal(nrow(file_frequency_data_frame), 0))


file_frequency_data_frame <- data.frame(
  file_type <- c(),
  frequency <- c(),
  stringsAsFactors = FALSE
)

# Testing an actual directory this time
directory = r"(C:\Users\leewa\Documents\Important documents\Learning Chinese\CHIN 111\Midterm - Oral)"
file_frequency_data_frame <- get_file_statistics(directory, file_frequency_data_frame)
test_that("2 jpg files", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "jpg", 2], 2))
test_that("4 pdf files", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "pdf", 2], 4))
test_that("1 file with no file type", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "No file type", 2], 1))
test_that("3 docx files", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "docx", 2], 3))
test_that("4 rows/file types in DF", expect_equal(nrow(file_frequency_data_frame), 4))

print_directory_driver()
cat('\014')  # Clear console
rm(list = ls())  # Clear variables
