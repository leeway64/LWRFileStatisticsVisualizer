# File statistics visualizer

file_statistics_visualizer_driver <- function(){
  name = readline(prompt = "Directory or file name: ")  # Get user input on directory
  if (!dir.exists(name) && !file.exists(name)){
    print("That file or directory does not exist")
  }else{
    file_statistics_visualizer(name, 0)
  }
}

file_statistics_visualizer <- function(name, level){
  if (level != 0){  # seq(0) is the same as c(1, 0)
    for (i in seq(level)){
      cat("    ")
    }
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

dev.off()  # Clear plots
cat('\014')  # Clear console
rm(list = ls())  # Clear variables
