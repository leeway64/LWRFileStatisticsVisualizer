# File statistics visualizer

# Data frame that holds the counts of each file type
file_frequency_data_frame <- data.frame(
  file_type <- character(),
  frequency <- integer(),
  stringsAsFactors = FALSE
  )

# Driver function for the file_statistics_visualizer function
file_statistics_visualizer_driver <- function(){
  name = readline(prompt = "Directory or file name: ")  # Get user input on directory
  if (!dir.exists(name) && !file.exists(name)){
    print("That file or directory does not exist")
  }else{
    file_statistics_visualizer(name, 0)
  }
}

# Adds a file type to the file_frequency data frame
# @param file_type is the name of the file type as a character data type
add_file_type_to_data_frame <- function(file_type){
  if (any(file_frequency_data_frame == file_type)){  # If the data frame already has the file type...
    file_frequency_data_frame[file_frequency_data_frame$var1 == file_type, 2] = file_frequency_data_frame[file_frequency_data_frame$var1 == file_type, 2] + 1  # increment the count of that file type
    
  }else {  # If not, then create a new row labeled with the file type and set the count to 1
    new_file_type_row <- data.frame(
      var1 = c(file_type),
      var2 = c(1),
      stringsAsFactors = FALSE
    )
    file_frequency_data_frame <- rbind(file_frequency_data_frame, new_file_type_row)
  }
}

# Determines the file type of a certain file
# @param name is the name of the file to find the file type of. name is a character.
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
    file_type = tolower(file_type)
    return(file_type)
  } 
}

# Function that displays a bar chart and pie chart of the file types within a given directory
file_statistics_visualizer <- function(name, level){
  file_type = find_file_type(name)
  add_file_type_to_data_frame(file_type)
  # print(basename(name))
  if (dir.exists(name)){
    # list.files lists all files and subdirectories within the current directory
    for (file in list.files(name)){
      path = file.path(name, file)
      file_statistics_visualizer(path, level+1)
    }
  }
}
