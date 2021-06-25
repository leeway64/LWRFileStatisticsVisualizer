# Testing
library(testthat)


# Provides the print_directory function
source(r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\Print directory.R)")
source(r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\File statistics visualizer.R)")

# File type testing
test_that("PDF", expect_equal(1, 1))
print(find_file_type("test.z.z.z.z.z.a.a.a.ab.b.b.c.d"))


dev.off()  # Clear plots
cat('\014')  # Clear console
rm(list = ls())  # Clear variables
