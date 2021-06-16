# File statistics visualizer

source(r"(C:\Users\leewa\Documents\Important documents\Computer Science\R Projects\File statistics visualizer\Print directory.R)")

file_frequency <- data.frame(
  file_type <- character(),
  frequency <- integer(),
  stringsAsFactors = FALSE
  )

file_statistics_visualizer_driver <- function(){
  name = readline(prompt = "Directory or file name: ")  # Get user input on directory
  if (!dir.exists(name) && !file.exists(name)){
    print("That file or directory does not exist")
  }else{
    file_statistics_visualizer(name, 0)
  }
}

file_statistics_visualizer <- function(name, level){
  if (file.exists(name)){  # If it is a file
    print("hello")
    file_name = basename(name)
    split_name = strsplit(file_name, split = ".", fixed = TRUE)    
  }
  
  print(basename(name))
  if (dir.exists(name)){
    # list.files lists all files and subdirectories within the current directory
    for (file in list.files(name)){
      path = file.path(name, file)
      file_statistics_visualizer(path, level+1)
    }
  }
}

file_statistics_visualizer_driver()

print_directory_driver()

dev.off()  # Clear plots
cat('\014')  # Clear console
rm(list = ls())  # Clear variables
