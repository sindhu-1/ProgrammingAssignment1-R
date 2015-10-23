corr <- function(directory,threshold=0){
thresval <- vector("numeric")
completeall <- complete(directory,1:332)
comp <- completeall[completeall$nobs>=threshold,]

if(nrow(comp)>0){
for(x in 1:nrow(comp)){
fileid <- formatC(comp$id[x], width=3, flag="0")
fid <- paste(fileid,".csv",sep="")
filen <- paste(directory,fid,sep="/")
monit <- read.csv(filen,header=T,stringsAsFactors=FALSE)
monitor<- monit[complete.cases(monit),]
thresval[x]<-cor(monitor$sulfate,monitor$nitrate)

}
}
return(thresval)

}


cr <- corr("specdata", 150)
summary(cr)