# Print all the files and subdirectories within a certain directory


print_directory_driver <- function() {
  name = readline(prompt = "Directory or file name: ")  # Get user input on directory
  if (!dir.exists(name) && !file.exists(name)){
    print("That file or directory does not exist")
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
  
  print(basename(name))
  if (dir.exists(name)) {
    # list.files lists all files and subdirectories within the current directory
    for (file in list.files(name)) {
      path = file.path(name, file)
      print_directory(path, level+1)
    }
  }
}
