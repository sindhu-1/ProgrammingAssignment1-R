require(plyr)

pollutantmean<- function(directory,pollutant,id=1:332){
fileid <- formatC(id, width=3, flag="0")
f <- paste(fileid,".csv",sep="")
filen <- paste(directory,f,sep="/")

lst <- lapply(filen, read.csv)
df <- ldply(lst)
meanval <- mean(df[, pollutant], na.rm = TRUE)
return(meanval)
}


