ref=read.csv('./tmp/step1.csv',h=T,stringsAsFactors=F)
ref$col5=paste0(ref$col4,'_ok')
write.csv(ref,'./tmp/step2.csv',quote=F,row.names=F)