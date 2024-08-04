setwd("/mnt/data/ehu/GCCalc")

Bfl<-read.csv("Old/Bfl.fna.csv")
Llo<-read.csv("Old/Llo.fna.csv")
Pma<-read.csv("Old/Pma.fna.csv")

Bfl <- head(Bfl[order(-Bfl$seqlen),],19)
Pma <- head(Pma[order(-Pma$seqlen),],19)
Llo <- head(Llo[order(-Llo$seqlen),],19)

BflInd <- c(10,19,17,11,5,6,14,7,12)
PmaInd <- c(15,19,18,8,7,11,16,6,14)
LloInd <- c(15,17,19,2,7,11,12,9,10)

all_indices <- 1:19
BflCompInd <- setdiff(all_indices, BflInd)
PmaCompInd <- setdiff(all_indices, PmaInd)
LloCompInd <- setdiff(all_indices, LloInd)

BflO <- Bfl$gccontent[BflInd]
PmaO <- Pma$gccontent[PmaInd]
LloO <- Llo$gccontent[LloInd]

BflNO <- Bfl$gccontent[BflCompInd]
PmaNO <- Pma$gccontent[PmaCompInd]
LloNO <- Llo$gccontent[LloCompInd]

plot(x = (BflO),
     y = (PmaO),
     xlab = "GC Content in Bfl",
     ylab = "GC Content in Pma",
     col = "red",
     main = "GC Content in Pma vs Bfl",
     xlim = c(0.38,0.42),
     ylim = c(0.36,0.38))
points(x=BflNO,y=PmaNO,col="orange")
legend(x="topright",legend=c("Orthologous","NonOrthologous"),fill=c("red","orange"))

plot(x = (BflO),
     y = (LloO),
     xlab = "GC Content in Bfl",
     ylab = "GC Content in Llo",
     col = "yellow",
     main = "GC Content in Llo vs Bfl",
     xlim = c(0.38,0.42),
     ylim = c(0.4,0.43))
points(x=BflNO,y=LloNO,col="green")
legend(x="topright",legend=c("Orthologous","NonOrthologous"),fill=c("yellow","green"))

plot(x = (PmaO),
     y = (LloO),
     xlab = "GC Content in Pma",
     ylab = "GC Content in Llo",
     col = "blue",
     main = "GC Content in Llo vs Pma",
     xlim = c(0.36,0.38),
     ylim = c(0.4,0.43))
points(x=PmaNO,y=LloNO,col="purple")
legend(x="topright",legend=c("Orthologous","NonOrthologous"),fill=c("blue","purple"))