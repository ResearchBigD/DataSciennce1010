
pollutantmean <- function(directory,pollutant,id=1:332){
  #Read all arguments
  str_directory_name <- directory
  str_pollutant_name <- pollutant
  vector_monitor_num <- id
  
  #print(str_pollutant_name)
  
  #Build file name
  library(stringr)
  vector_monitor_num <- str_pad(vector_monitor_num,3,pad=0)
  vecotr_monitor_num <- sapply(vector_monitor_num, paste,".csv",sep="")
  vector_file_list <- paste(str_directory_name,"/",vecotr_monitor_num,sep="")
  #print(vector_file_list)
  
  largefile <- data.frame()
  
  for(i in seq_along(vector_file_list)){
    largefile <- rbind(largefile, data.frame(read.csv(vector_file_list[i])))
  }
  
  #Calculate mean
  #Optionn # 1
  mean(largefile[,str_pollutant_name],na.rm=TRUE)
  
  #mean(largefile[,"Date"], na.rm=TRUE)
  
}
