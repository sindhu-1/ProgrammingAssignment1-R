complete <- function(directory,id){

ob <- 0
fileid <- formatC(id, width=3, flag="0")
fid <- paste(fileid,".csv",sep="")
filen <- paste(directory,fid,sep="/")

for(i in 1:length(id)){
dat <- read.csv(filen[i],header=T,stringsAsFactors=FALSE)
ob[i]<-nrow((dat[complete.cases(dat),]))
}
dataf <- data.frame(id= id,nobs=ob)

return(dataf)
}

complete("specdata",30:25)
complete("specdata", c(2, 4, 8, 10, 12))