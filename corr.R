corr <- function(directory,threshold = 0){
  #Read all arguments
  if(grep("specdata", directory) == 1) {
    str_directory_name <- ("./specdata/")
  }
  
  # find all files in the specdata folder
  all_files <- as.character( list.files(str_directory_name) )
  file_paths <- paste(str_directory_name, all_files, sep="")
  
  num_threshold <- threshold
  
  largefile <- complete(str_directory_name,1:332)
  cnames <- c("id","nobs")
  colnames(largefile) <- cnames
  
  largefile_threshold <- subset(largefile,largefile$nobs>num_threshold)
  
  id <- largefile_threshold[,1]
  id_len <- length(id)
  corr_vector <- rep(0, id_len)
  
  j <- 1
  for(i in id) {
    ##print(i)
    ##print(j)
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j + 1
  }
  result <- corr_vector
  return(result)  
  
}
