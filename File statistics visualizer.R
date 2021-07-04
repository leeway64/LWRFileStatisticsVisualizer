# File statistics visualizer

library(stringr)
library(dplyr)
library(tools)


# Driver function. Prompts the user for a directory, then displays the statistics about the
# directory.
file_statistics_visualizer <- function(){
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
    file_frequency_data_frame <- get_file_statistics(name, file_frequency_data_frame)
    # Sort file_frequency_data_frame in descending order
    file_frequency_data_frame <- arrange(file_frequency_data_frame, desc(frequency))
    
    create_bar_chart(file_frequency_data_frame)
    create_pie_chart(file_frequency_data_frame)
  }
}


# Creates bar chart of the counts of each file type contained in data_frame
create_bar_chart <- function(data_frame){
  barplot(data_frame$frequency,
          main = "Counts of file types",
          xlab = "File type",
          ylab = "Frequency",
          names = data_frame$file_type,
          col = rainbow(length(data_frame$file_type)))
}


# Creates pie chart of the percentages of each file type contained in data_frame
create_pie_chart <- function(data_frame){
  frequency <- data_frame$frequency
  pie_percentages <- round(100 * frequency / sum(frequency), 1)
  pie_percentages <- paste0(pie_percentages, "%")
  
  dev.new()
  pie(frequency,
      labels = pie_percentages,
      main = "File type percentages in this directory", 
      col = rainbow(length(frequency)),
      clockwise = FALSE)
  
  legend("bottomleft",
         data_frame$file_type,
         cex = 0.8,
         fill = rainbow(length(frequency)))
}


# Adds a file type to the file_frequency data frame. file_type is the name of the file type as
# a character data type.
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


# Determines the file type of a certain file. name is the name of the file to find the file type of.
# name is a character.
find_file_type <- function(name){
  file_type <- file_ext(name)
  if (file_type == ""){
    file_type <- "No file type"
  }
  return(file_type)
}


# Updates a data frame with the file types within a given directory
get_file_statistics <- function(name, data_frame){
  if (!dir.exists(name)){  # If it is not a directory, then it must be a file
    file_type = find_file_type(name)
    data_frame = add_file_type_to_data_frame(file_type, data_frame)
  } else {  # If it is a directory...
    # list.files lists all files and subdirectories within the current directory
    for (file in list.files(name)){
      path = file.path(name, file)
      data_frame <- get_file_statistics(path, data_frame)
    }
  }
  return(data_frame)
}
