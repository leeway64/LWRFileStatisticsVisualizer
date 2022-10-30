# Print all the files and subdirectories within a certain directory


print_directory_driver <- function() {
  cat("Directory or file name: ")
  name = readLines("stdin", n=1)
  if (!dir.exists(name) && !file.exists(name)){
    cat("That file or directory does not exist\n")
  } else {
    print_directory(name, 0)
  }
}


print_directory <- function(name, level) {
  if (level != 0) {  # seq(0) is the same as c(1, 0)
    for (i in seq(level)){
      cat("    ")
    }
  }
  
  cat(paste(basename(name), "\n"))
  if (dir.exists(name)) {
    # list.files lists all files and subdirectories within the current directory
    for (file in list.files(name)) {
      path = file.path(name, file)
      print_directory(path, level+1)
    }
  }
}
