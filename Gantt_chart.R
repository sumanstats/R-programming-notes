library(plotrix)
source("gantt.R")

Ymd.format<-"%Y/%m/%d"
gantt.info<-list(labels=
                   c("IRB Approval"  ,"Identification of participants", "Data Collection"  ,"Interim Analysis", "Final Analysis",
                     "Thesis Submission"),
                 starts=
                   as.POSIXct(strptime(
                     c("2017/08/01","2017/09/01","2017/09/01", "2018/02/01","2018/06/01","2018/08/01"),
                     format=Ymd.format)),
                 ends=
                   as.POSIXct(strptime(
                     c("2017/09/01","2018/06/01","2018/06/01", "2018/03/01","2018/08/01","2018/09/01"),
                     format=Ymd.format)),
                 priorities=c(1,2,3,4,5,6))
vgridpos<-as.POSIXct(strptime(c("2017/08/01",
                                "2017/09/01","2017/10/01","2017/11/01","2017/12/01","2018/01/01","2018/02/01","2018/03/01",
                                "2018/04/01","2018/05/01","2018/06/01","2018/07/01","2018/08/01",
                                "2018/09/01","2018/10/01","2018/11/01","2018/12/01"),format=Ymd.format))
vgridlab<-
  c("Aug","Sep","Oct","Nov","Dec","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")







pdf("sk.pdf")
par(family="serif")
gantt.chart(gantt.info,priority.legend=FALSE,half.height=0.35,
            vgridpos=vgridpos,vgridlab=vgridlab,xlab="Months",hgrid=TRUE)
par(cex=1)
mtext("Thesis workflow for year 2017-18",side=3,line=2,cex=1.5,col="blue")
dev.off()
