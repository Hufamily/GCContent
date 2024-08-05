# Folders
GCCalc are a couple scripts I created to look at gc content, ag content, gc skew, and at skew in genomes from ncbi.

RepeatGC are a set of scripts I created to compare gc content in repeats and non repeats across species from softmasked genomes from ncbi, or from EarlGrey, the conda library for RepeatMasker.

Ethan Hu 2024 Summer at Sym Geno Evo Lab is a powerpoint presentation showing results of research.

# Highlights
## GCCalc
Using symgenoevolab's [SyntenyFinder](https://github.com/symgenoevolab/SyntenyFinder/tree/main) I attempted to find correlations between ALG ancestral genes of bilaterals and GC content for *B. floridae, P. maximus, L. longissimus, C. mucedo, M. membranacea*
### Macryosynteny Graph
![alt text](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/bilateralMacrosyntenyGraph.png)
### Sliding Window Analysis
![Sliding Window Analysis of Mme 4](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/membraniporaMembranaceaChromosome4SlidingWindowAnalysis.png)
### Bimodal Distribution of GC Content in *L. longissimus*
While looking at the GC distribution of genes, an interesting observation was a bimodal distribution in *L. longissimus* chromosome 6.
![Bilaterian Chromosomes Violin Plot](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/GCContentInBilateralGenesViolinPlot.png)

Using the sliding window analysis, it was observed that the high GC genes, GC content between 0.5 to 0.6, were concentrated in specific areas.
![Sliding Window Analysis of Llo 6](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/lineusLongissimusChromosome6BimodalDistribution.png)

## RepeatGC
In each species, the repeat GC seemed to be more extreme, having higher GC in higher GC regions and vice versa, in each window.
![Repeat GC vs GC in Mme](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/membraniporaMembranaceaRepeatGCvsGC.png)

This held true across all species investigated if we took the GC content of the repeatmasked regions in the genome, and the GC content of the non-repeatmasked regions.
![RepeatGC vs GC in Eukaryotes](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/eukaryoteRepeatGCvsGC.png)
