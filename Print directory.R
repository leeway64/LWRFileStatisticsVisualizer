# Print all the files and subdirectories within a certain directory

print_directory_driver <- function(){
  name = readline(prompt = "Directory or file name: ")  # get user input on directory
  name = gsub("\\\\", "/", name)  # Replace 1 backslash with 1 forward slash
  if (!dir.exists(name) && !file.exists(name)){
    print("That file or directory does not exist")
  }else{
    print_directory(name, 0)
  }
}

print_directory <- function(name, level){
  # for (i in 0:level){
  #   cat("    ")
  # }
  print(basename(name))
  if (dir.exists(name)){
    # list.files lists all files and subdirectories within the current directory
    for (file in list.files(name)){
      path = file.path(name, file)
      print_directory(path, file)
    }
  }
}
