library(ggplot2)

setwd("/mnt/data/ehu/GCCalc")

Bfl_gtf <- read.csv("Old/Bfl.gtf.csv")
Cmu_gtf <- read.csv("Old/Cmu.gtf.csv")
Llo_gtf <- read.csv("Old/Llo.gtf.csv")
Mme_gtf <- read.csv("Old/Mme.gtf.csv")
Pma_gtf <- read.csv("Old/Pma.gtf.csv")

Bfl_fna <- read.csv("Old/Bfl.fna.csv")
Cmu_fna <- read.csv("Old/Cmu.fna.csv")
Llo_fna <- read.csv("Old/Llo.fna.csv")
Mme_fna <- read.csv("Old/Mme.fna.csv")
Pma_fna <- read.csv("Old/Pma.fna.csv")

BflChromosomes <- head(Bfl_fna[order(-Bfl_fna$seqlen),],19)
CmuChromosomes <- head(Cmu_fna[order(-Cmu_fna$seqlen),],8)
LloChromosomes <- head(Llo_fna[order(-Llo_fna$seqlen),],19)
MmeChromosomes <- head(Mme_fna[order(-Mme_fna$seqlen),],11)
PmaChromosomes <- head(Pma_fna[order(-Pma_fna$seqlen),],19)

# BflAvg <- sum(BflChromosomes$seqlen*BflChromosomes$gccontent)/sum(BflChromosomes$seqlen)
# CmuAvg <- sum(CmuChromosomes$seqlen*CmuChromosomes$gccontent)/sum(CmuChromosomes$seqlen)
# LloAvg <- sum(LloChromosomes$seqlen*LloChromosomes$gccontent)/sum(LloChromosomes$seqlen)
# MmeAvg <- sum(MmeChromosomes$seqlen*MmeChromosomes$gccontent)/sum(MmeChromosomes$seqlen)
# PmaAvg <- sum(PmaChromosomes$seqlen*PmaChromosomes$gccontent)/sum(PmaChromosomes$seqlen)

color_mapping <- list(
  "A" = "#A6CDE3", 
  "B" = "#089E78", 
  "C" = "#F19799", 
  "D" = "#F7F09B", 
  "E" = "#AF5B2A",
  "F" = "#DA6227", 
  "G" = "#7671B0", 
  "H" = "#E42C8A", 
  "I" = "#65A744", 
  "J" = "#C9B2D3",
  "K" = "#E6AB22", 
  "L" = "#A4782B", 
  "M" = "#90CDC3", 
  "N" = "#686868", 
  "O" = "#EF7E25",
  "P" = "#BDB9DA", 
  "Q" = "#FED832", 
  "R" = "#00008B",
  "S" = "#BF66E5"
)

# Define columns and read the data from file
SCcolumns <- c("index", "Junk", "sequence", "start", "end", "color_key")

Bfl_SC <- read.table("input_data/gene_rows_SC/Bfl_coordinates.tsv", sep = '\t', comment.char = '#', header = FALSE, col.names = SCcolumns, colClasses = c("integer", "character", "character", "integer", "integer", "character"))
Bfl_SC <- subset(Bfl_SC, color_key %in% names(color_mapping))
Bfl_SC$color <- color_mapping[Bfl_SC$color_key]

Pma_SC <- read.table("input_data/gene_rows_SC/Pma_coordinates.tsv", sep = '\t', comment.char = '#', header = FALSE, col.names = SCcolumns, colClasses = c("integer", "character", "character", "integer", "integer", "character"))
Pma_SC <- subset(Pma_SC, color_key %in% names(color_mapping))
Pma_SC$color <- color_mapping[Pma_SC$color_key]

Llo_SC <- read.table("input_data/gene_rows_SC/Llo_coordinates.tsv", sep = '\t', comment.char = '#', header = FALSE, col.names = SCcolumns, colClasses = c("integer", "character", "character", "integer", "integer", "character"))
Llo_SC <- subset(Llo_SC, color_key %in% names(color_mapping))
Llo_SC$color <- color_mapping[Llo_SC$color_key]

Mme_SC <- read.table("input_data/gene_rows_SC/Mme_coordinates.tsv", sep = '\t', comment.char = '#', header = FALSE, col.names = SCcolumns, colClasses = c("integer", "character", "character", "integer", "integer", "character"))
Mme_SC <- subset(Mme_SC, color_key %in% names(color_mapping))
Mme_SC$color <- color_mapping[Mme_SC$color_key]

Cmu_SC <- read.table("input_data/gene_rows_SC/Cmu_coordinates.tsv", sep = '\t', comment.char = '#', header = FALSE, col.names = SCcolumns, colClasses = c("integer", "character", "character", "integer", "integer", "character"))
Cmu_SC <- subset(Cmu_SC, color_key %in% names(color_mapping))
Cmu_SC$color <- color_mapping[Cmu_SC$color_key]

all_null <- function(x) {
  all(sapply(x, is.null))
}

avgColor <- function(cList){
  if (all_null(cList)){
    return("#FFFFFF")
  }
  rgb_values <- col2rgb(cList)
  avg_rgb <- rowMeans(rgb_values)
  avg_rgb <- round(avg_rgb)
  avg_hex <- rgb(avg_rgb[1], avg_rgb[2], avg_rgb[3], maxColorValue = 255, names = FALSE)
  return(avg_hex)
}

# Initialize a list to store GC content values
GC <- list()
colors <- list()
# Iterate through the top Bfl chromosomes to get GC content for genes
for (name in BflChromosomes$name) {
  genes_gc <- Bfl_gtf$gccontent[Bfl_gtf$sequence == name & Bfl_gtf$feature == 'gene']
  if (length(genes_gc) > 0) {
    GC[[name]] <- genes_gc #- BflAvg
  }
  colors <- c(colors, avgColor(Bfl_SC$color[Bfl_SC$sequence == name]))
}

for (name in PmaChromosomes$name) {
  genes_gc <- Pma_gtf$gccontent[Pma_gtf$sequence == name & Pma_gtf$feature == 'gene']
  if (length(genes_gc) > 0) {
    GC[[name]] <- genes_gc #- PmaAvg
  }
  colors <- c(colors, avgColor(Pma_SC$color[Pma_SC$sequence == name]))
}

for (name in LloChromosomes$name) {
  genes_gc <- Llo_gtf$gccontent[Llo_gtf$sequence == name & Llo_gtf$feature == 'gene']
  if (length(genes_gc) > 0) {
    GC[[name]] <- genes_gc #- LloAvg
  }
  colors <- c(colors, avgColor(Llo_SC$color[Llo_SC$sequence == name]))
}

for (name in MmeChromosomes$name) {
  genes_gc <- Mme_gtf$gccontent[Mme_gtf$sequence == name & Mme_gtf$feature == 'gene']
  if (length(genes_gc) > 0) {
    GC[[name]] <- genes_gc #- MmeAvg
  }
  colors <- c(colors, avgColor(Mme_SC$color[Mme_SC$sequence == name]))
}

for (name in CmuChromosomes$name) {
  genes_gc <- Cmu_gtf$gccontent[Cmu_gtf$sequence == name & Cmu_gtf$feature == 'gene']
  if (length(genes_gc) > 0) {
    GC[[name]] <- genes_gc #- CmuAvg
  }
  colors <- c(colors, avgColor(Cmu_SC$color[Cmu_SC$sequence == name]))
}

# Convert the list to a data frame for plotting
data <- do.call(rbind, lapply(names(GC), function(x) {
  data.frame(sequence = x, gccontent = GC[[x]])
}))
data$sequence <- factor(data$sequence, levels = unique(data$sequence))

# Convert colors list to a character vector
colors <- unlist(colors)
color_strings <- vector()
for (i in seq_along(colors)) {
  color_strings[i] <- colors[[i]]
}
colors <- color_strings
# Generate the violin plot
p<-ggplot(data, aes(x = sequence, y = gccontent, fill = sequence)) +
  geom_violin(trim = FALSE) +
  geom_jitter(width=0.4, alpha=0.3) +
  scale_fill_manual(values = colors) +
  labs(title = "GC Content for Genes in Bfl, Pma, Llo, Mme, Cmu Chromosomes",
       x = "Chromosome",
       y = "GC Content") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

print(p)