setwd("/mnt/data/ehu/GCCalc")

Bfl<-read.csv("Old/Bfl.gtf.csv") 
Cmu<-read.csv("Old/Cmu.gtf.csv")
Llo<-read.csv("Old/Llo.gtf.csv")
Mme<-read.csv("Old/Mme.gtf.csv")
Pma<-read.csv("Old/Pma.gtf.csv")

# Bfl <- Bfl[order(-Bfl$seqlen),]
# Cmu <- Cmu[order(-Cmu$seqlen),]
# Llo <- Llo[order(-Llo$seqlen),]
# Mme <- Mme[order(-Mme$seqlen),]
# Pma <- Pma[order(-Pma$seqlen),]

pdf("AG:GCplts.pdf")

plot(x = Bfl[Bfl$feature=='CDS',]$gccontent,
     y = Bfl[Bfl$feature=='CDS',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "red",
     main = "AG Content vs GC Content in the CDS",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Cmu[Cmu$feature=='CDS',]$gccontent,
     y = Cmu[Cmu$feature=='CDS',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "orange",
     main = "AG Content vs GC Content in the CDS",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Llo[Llo$feature=='CDS',]$gccontent,
     y = Llo[Llo$feature=='CDS',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "yellow",
     main = "AG Content vs GC Content in the CDS",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Mme[Mme$feature=='CDS',]$gccontent,
     y = Mme[Mme$feature=='CDS',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "green",
     main = "AG Content vs GC Content in the CDS",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Pma[Pma$feature=='CDS',]$gccontent,
     y = Pma[Pma$feature=='CDS',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "blue",
     main = "AG Content vs GC Content in the CDS",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Bfl[Bfl$feature=='gene',]$gccontent,
     y = Bfl[Bfl$feature=='gene',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "red",
     main = "AG Content vs GC Content in the Gene",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Cmu[Cmu$feature=='gene',]$gccontent,
     y = Cmu[Cmu$feature=='gene',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "orange",
     main = "AG Content vs GC Content in the Gene",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Llo[Llo$feature=='gene',]$gccontent,
     y = Llo[Llo$feature=='gene',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "yellow",
     main = "AG Content vs GC Content in the Gene",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Mme[Mme$feature=='gene',]$gccontent,
     y = Mme[Mme$feature=='gene',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "green",
     main = "AG Content vs GC Content in the Gene",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Pma[Pma$feature=='gene',]$gccontent,
     y = Pma[Pma$feature=='gene',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "blue",
     main = "AG Content vs GC Content in the Gene",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Bfl[Bfl$feature=='exon',]$gccontent,
     y = Bfl[Bfl$feature=='exon',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "red",
     main = "AG Content vs GC Content in the Exon",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Cmu[Cmu$feature=='exon',]$gccontent,
     y = Cmu[Cmu$feature=='exon',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "orange",
     main = "AG Content vs GC Content in the Exon",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Llo[Llo$feature=='exon',]$gccontent,
     y = Llo[Llo$feature=='exon',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "yellow",
     main = "AG Content vs GC Content in the Exon",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Mme[Mme$feature=='exon',]$gccontent,
     y = Mme[Mme$feature=='exon',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "green",
     main = "AG Content vs GC Content in the Exon",
     xlim = c(0,1),
     ylim = c(0,1))

plot(x = Pma[Pma$feature=='exon',]$gccontent,
     y = Pma[Pma$feature=='exon',]$agcontent,
     xlab = "GC Content",
     ylab = "AG Content",
     col = "blue",
     main = "AG Content vs GC Content in the Exon",
     xlim = c(0,1),
     ylim = c(0,1))

dev.off()