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

add_file_type_to_data_frame(file_type){
  if (any(file_frequency == file_type)){  # If the data frame already has the file type...
    data2[data2$var1 == "z", 2] = data2[data2$var1 == "z", 2] + 1  # increment the count of z
    
  }else {  # If not, then create a new row labeled z and set the count to 1
    data3 <- data.frame(
      var1 = c("z"),
      var2 = c(1),
      stringsAsFactors = FALSE
    )
    data2 <- rbind(data2, data3)
  }
}

find_file_type <- function(name){
  if (!dir.exists(name)){  # If it is not a directory, then it must be a file
    # print(basename(name))
    file_name = basename(name)
    split_name = strsplit(file_name, split = ".", fixed = TRUE)
    if (length(split_name[[1]]) == 1){
      file_type = "No file type"
    }else{
      file_type = tail(split_name[[1]], n = 1)
    }
    print(file_type[1])
  } 
}

file_statistics_visualizer <- function(name, level){
  find_file_type(name)
  # print(basename(name))
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
