# LWRFileStatisticsVisualizer test suite

library(testthat)
library(here)

source(here("src", "print-directory.R"))
source(here("src", "LWRFileStatisticsVisualizer.R"))


# File type identification testing
test_file_type_identification <- function()
{
    test_that("pdf", expect_equal(find_file_type("file.pdf"), "pdf"))
    test_that("docx", expect_equal(find_file_type("word.docx"), "docx"))
    test_that("md", expect_equal(find_file_type(here("README.md")), "md"))
    test_that("r", expect_equal(find_file_type(here("test", "test_suite.R")), "r"))
    test_that("gitignore", expect_equal(find_file_type(here(".gitignore")), "gitignore"))
    test_that("No file type", expect_equal(find_file_type("none"), "No file type"))
}


# Test adding a file type to a data frame
test_adding_file_type_to_data_frame <- function()
{
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
}


# Test the file type frequencies of test-directory-1
test_test_directory_1_frequencies <- function()
{
    file_frequency_data_frame <- data.frame(
      file_type <- c(),
      frequency <- c(),
      stringsAsFactors = FALSE
    )

    directory = here("test", "test-directory-1")
    file_frequency_data_frame <- get_file_statistics(directory, file_frequency_data_frame)
    test_that("2 txt files", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "txt", 2], 2))
    test_that("1 pptx file", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "pptx", 2], 1))
    test_that("1 xlsx file", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "xlsx", 2], 1))
    test_that("1 docx file", expect_equal(file_frequency_data_frame[file_frequency_data_frame$file_type == "docx", 2], 1))
    test_that("4 rows/file types in DF", expect_equal(nrow(file_frequency_data_frame), 4))
}


# Test the file type frequencies of an empty directory
test_empty_directory_frequencies <- function()
{
    # Need to create an empty directory because empty directories can't be committed using Git
    dir.create(here("test", "test-directory-2", "Subdir0", "SubdirZ"))
    file_frequency_data_frame <- data.frame(
      file_type <- c(),
      frequency <- c(),
      stringsAsFactors = FALSE
    )

    # This directory contains no files or other directories
    directory = here("test", "test-directory-2", "Subdir0", "SubdirZ")
    file_frequency_data_frame <- get_file_statistics(directory, file_frequency_data_frame)
    test_that("Empty file_type vector", expect_equal(length(file_frequency_data_frame$file_type) == 0, TRUE))
    test_that("Empty frequency vector", expect_equal(length(file_frequency_data_frame$frequency) == 0, TRUE))
    test_that("0 rows/file types in DF", expect_equal(nrow(file_frequency_data_frame), 0))
    
    # Delete the directory that was created earlier
    unlink(here("test", "test-directory-2", "Subdir0", "SubdirZ"), recursive = TRUE)
}


if (is.null(box::name()))
{
    test_file_type_identification()
    test_adding_file_type_to_data_frame()
    test_test_directory_1_frequencies()
    test_empty_directory_frequencies()
}
