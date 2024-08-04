setwd("/mnt/data/ehu/GCCalc")

Bfl<-read.csv("Old/Bfl.fna.csv") 
Cmu<-read.csv("Old/Cmu.fna.csv")
Llo<-read.csv("Old/Llo.fna.csv")
Mme<-read.csv("Old/Mme.fna.csv")
Pma<-read.csv("Old/Pma.fna.csv")

Bfl <- Bfl[order(-Bfl$seqlen),]
Cmu <- Cmu[order(-Cmu$seqlen),]
Llo <- Llo[order(-Llo$seqlen),]
Mme <- Mme[order(-Mme$seqlen),]
Pma <- Pma[order(-Pma$seqlen),]

# pdf("Rplots.pdf")
# 
# plot(x = 1:19,
#      y = head(Bfl$gccontent,19),
#      xlab = "Chromosome",
#      ylab = "GC Content",
#      col = "red",
#      main = "GC Content vs Chromosome",
#      ylim = c(0.35,0.5))
# points(x=1:8,y=head(Cmu$gccontent,8),col="orange")
# points(x=1:19,y=head(Llo$gccontent,19),col="yellow")
# points(x=1:11,y=head(Mme$gccontent,11),col="green")
# points(x=1:19,y=head(Pma$gccontent,19),col="blue")
# 
# plot(x = 1:19,
#      y = head(Bfl$agcontent,19),
#      xlab = "Chromosome",
#      ylab = "AG Content",
#      col = "red",
#      main = "AG Content vs Chromosome",
#      ylim = c(0.46,0.52))
# points(x=1:8,y=head(Cmu$agcontent,8),col="orange")
# points(x=1:19,y=head(Llo$agcontent,19),col="yellow")
# points(x=1:11,y=head(Mme$agcontent,11),col="green")
# points(x=1:19,y=head(Pma$agcontent,19),col="blue")
# 
# plot(x = 1:19,
#      y = head(Bfl$gcskew,19),
#      xlab = "Chromosome",
#      ylab = "GC Skew",
#      col = "red",
#      main = "GC Skew vs Chromosome",
#      ylim = c(-0.02,0.02))
# points(x=1:8,y=head(Cmu$gcskew,8),col="orange")
# points(x=1:19,y=head(Llo$gcskew,19),col="yellow")
# points(x=1:11,y=head(Mme$gcskew,11),col="green")
# points(x=1:19,y=head(Pma$gcskew,19),col="blue")
# 
# plot(x = 1:19,
#      y = head(Bfl$atskew,19),
#      xlab = "Chromosome",
#      ylab = "AT Skew",
#      col = "red",
#      main = "AT Skew vs Chromosome",
#      ylim = c(-0.02,0.02))
# points(x=1:8,y=head(Cmu$atskew,8),col="orange")
# points(x=1:19,y=head(Llo$atskew,19),col="yellow")
# points(x=1:11,y=head(Mme$atskew,11),col="green")
# points(x=1:19,y=head(Pma$atskew,19),col="blue")
# 
# plot(x = 1:19,
#      y = log(head(Bfl$seqlen,19)),
#      xlab = "Chromosome",
#      ylab = "Log(Length) (log(bp)",
#      col = "red",
#      main = "Sequence Length vs Chromosome",
#      ylim = c(16,20))
# points(x=1:8,y=log(head(Cmu$seqlen,8)),col="orange")
# points(x=1:19,y=log(head(Llo$seqlen,19)),col="yellow")
# points(x=1:11,y=log(head(Mme$seqlen,11)),col="green")
# points(x=1:19,y=log(head(Pma$seqlen,19)),col="blue")
# 
# plot(x = log(head(Bfl$seqlen,19)),
#      y = head(Bfl$gcskew, 19),
#      xlab = "Log(Length) (log(bp)",
#      ylab = "GC Skew",
#      col = "red",
#      main = "GC Skew vs Sequence Length",
#      xlim = c(16,20),
#      ylim = c(-0.02, 0.02))
# points(x=log(head(Cmu$seqlen,8)), y=head(Cmu$gcskew,8),col="orange")
# points(x=log(head(Llo$seqlen,19)), y=head(Llo$gcskew, 19),col="yellow")
# points(x=log(head(Mme$seqlen,11)), y=head(Mme$gcskew, 11),col="green")
# points(x=log(head(Pma$seqlen,19)),y=head(Pma$gcskew, 19),col="blue")
# 
# plot(x = log(head(Bfl$seqlen,19)),
#      y = head(Bfl$atskew, 19),
#      xlab = "Log(Length) (log(bp)",
#      ylab = "AT Skew",
#      col = "red",
#      main = "AT Skew vs Sequence Length",
#      xlim = c(16,20),
#      ylim = c(-0.02, 0.02))
# points(x=log(head(Cmu$seqlen,8)), y=head(Cmu$atskew,8),col="orange")
# points(x=log(head(Llo$seqlen,19)), y=head(Llo$atskew, 19),col="yellow")
# points(x=log(head(Mme$seqlen,11)), y=head(Mme$atskew, 11),col="green")
# points(x=log(head(Pma$seqlen,19)),y=head(Pma$atskew, 19),col="blue")
# 
# plot(x = (head(Bfl$atskew,19)),
#      y = head(Bfl$gcskew, 19),
#      xlab = "AT Skew",
#      ylab = "GC Skew",
#      col = "red",
#      main = "GC Skew vs AT Skew",
#      xlim = c(-0.02,0.02),
#      ylim = c(-0.02, 0.02))
# points(x=(head(Cmu$atskew,8)), y=head(Cmu$gcskew,8),col="orange")
# points(x=(head(Llo$atskew,19)), y=head(Llo$gcskew, 19),col="yellow")
# points(x=(head(Mme$atskew,11)), y=head(Mme$gcskew, 11),col="green")
# points(x=(head(Pma$atskew,19)),y=head(Pma$gcskew, 19),col="blue")
# 
# plot(x = log(head(Bfl$seqlen,19)),
#      y = head(Bfl$gccontent, 19),
#      xlab = "Log(Length) (log(bp)",
#      ylab = "GC Content",
#      col = "red",
#      main = "GC Content vs Sequence Length",
#      xlim = c(16,20),
#      ylim = c(0.35, 0.5))
# points(x=log(head(Cmu$seqlen,8)), y=head(Cmu$gccontent,8),col="orange")
# points(x=log(head(Llo$seqlen,19)), y=head(Llo$gccontent, 19),col="yellow")
# points(x=log(head(Mme$seqlen,11)), y=head(Mme$gccontent, 11),col="green")
# points(x=log(head(Pma$seqlen,19)),y=head(Pma$gccontent, 19),col="blue")
# 
# plot(x = log(head(Bfl$seqlen,19)),
#      y = head(Bfl$agcontent, 19),
#      xlab = "Log(Length) (log(bp)",
#      ylab = "AG Content",
#      col = "red",
#      main = "AG Content vs Sequence Length",
#      xlim = c(16,20),
#      ylim = c(0.46, 0.52))
# points(x=log(head(Cmu$seqlen,8)), y=head(Cmu$agcontent,8),col="orange")
# points(x=log(head(Llo$seqlen,19)), y=head(Llo$agcontent, 19),col="yellow")
# points(x=log(head(Mme$seqlen,11)), y=head(Mme$agcontent, 11),col="green")
# points(x=log(head(Pma$seqlen,19)),y=head(Pma$agcontent, 19),col="blue")

plot(x = head(Bfl$agcontent,19),
     y = head(Bfl$gccontent,19),
     xlab = "AG Content",
     ylab = "GC Content",
     col = "red",
     main = "GC Content vs AG Content",
     xlim = c(0.47, 0.50),
     ylim = c(0.35,0.5))
points(x=head(Cmu$agcontent,8),y=head(Cmu$gccontent,8),col="orange")
points(x=head(Llo$agcontent,19),y=head(Llo$gccontent,19),col="yellow")
points(x=head(Mme$agcontent,11),y=head(Mme$gccontent,11),col="green")
points(x=head(Pma$agcontent,19),y=head(Pma$gccontent,19),col="blue")

# dev.off()