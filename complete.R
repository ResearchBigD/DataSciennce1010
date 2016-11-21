
complete <- function(directory,id=1:332){
  #Read all arguments
  str_directory_name <- directory
  vector_monitor_num <- id
  
  # Another way to get list of files - 
  #find all files in the specdata folder
  #all_files <- as.character( list.files(directory) )
  #file_paths <- paste(directory, all_files, sep="")
  # for (i in id) {
  #  current_file <- read.csv(file_paths[i], header=T, sep=",")
  

  largefile <- data.frame()

  for(i in seq_along(id)){
    
    #Build file name
    library(stringr)
    str_monitor_num <- str_pad(id[i],3,pad=0)
    str_monitor_num <- paste(str_monitor_num,".csv",sep="")
    str_file_name <- paste(str_directory_name,"/",str_monitor_num,sep="")
    
    readfile <- data.frame(read.csv(str_file_name))

    completecase <- complete.cases(readfile)
    
    largefile <- rbind(largefile,c(id[i],sum(completecase)))
    
  }
  cnames <- c("id","nobs")
  colnames(largefile) <- cnames
  largefile
}
