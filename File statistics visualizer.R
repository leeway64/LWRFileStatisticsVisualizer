# File statistics visualizer

library(stringr)

# Driver function for the file_statistics_visualizer function
file_statistics_visualizer_driver <- function(){
  name = readline(prompt = "Directory or file name: ")  # Get user input on directory
  if (!dir.exists(name) && !file.exists(name)){
    print("That file or directory does not exist")
  }else{
    # Data frame that holds the counts of each file type
    file_frequency_data_frame <- data.frame(
      file_type <- c(),
      frequency <- c(),
      stringsAsFactors = FALSE
    )
    file_frequency_data_frame <- get_file_statistics(name, 0, file_frequency_data_frame)
    create_bar_chart()
    create_pie_chart()
  }
}

create_bar_chart <- function(data_frame){
  
}

create_pie_chart <- function(data_frame){
  
}

# Adds a file type to the file_frequency data frame
# @param file_type is the name of the file type as a character data type
add_file_type_to_data_frame <- function(file_type, data_frame){
  # data_frame$file_type = append(data_frame$file_type, "pdf")
  if (any(data_frame == file_type)){  # If the data frame already has the file type...
    # increment the count of that file type by 1
    file_type_index = data_frame$file_type == file_type
    data_frame[file_type_index, 2] = 1 + data_frame[file_type_index, 2]

  }else {  # If not, then create a new row labeled with the file type and set the count to 1
    new_file_type_row <- data.frame(
      file_type = c(file_type),
      frequency = c(1),
      stringsAsFactors = FALSE
    )
    data_frame <- rbind(data_frame, new_file_type_row)
  }
  return(data_frame)
}

# Determines the file type of a certain file
# @param name is the name of the file to find the file type of. name is a character.
find_file_type <- function(name){
  if (!dir.exists(name)){  # If it is not a directory, then it must be a file
    # print(basename(name))
    file_name = basename(name)
    split_name = strsplit(file_name, split = ".", fixed = TRUE)
    # Accounts for files with no file type
    if ((length(split_name[[1]]) == 1) && (str_count(name, "\\.") == 0)){
      file_type = "No file type"
    # Accounts for files like ".gitignore"
    }else if((length(split_name[[1]]) == 1) && (str_count(name, "\\.") == 1)){
      file_type = tolower(tail(split_name[[1]], n = 1))
    # Accounts for all other files, even including "Digital-Signal-Processor.vcxproj.filters"
    }else{
      locate_all_periods = str_locate_all(pattern = "\\.", file_name)
      first_period_location = locate_all_periods[[1]][1, 1]
      file_type = tolower(substring(file_name, first_period_location + 1, ))
    }
    return(file_type)
  } 
}

# Function that displays a bar chart and pie chart of the file types within a given directory
get_file_statistics <- function(name, level, data_frame){
  file_type = find_file_type(name)
  
  data_frame = add_file_type_to_data_frame(file_type, data_frame)
  # print(basename(name))
  if (dir.exists(name)){
    # list.files lists all files and subdirectories within the current directory
    for (file in list.files(name)){
      path = file.path(name, file)
      get_file_statistics(path, level + 1, data_frame)
    }
  }
  return(data_frame)
}
