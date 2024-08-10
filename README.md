# Folders
```
GCContent
├── GCCalc
│   ├── BoxAndWhiskersPlot.R
│   ├── Counter.py
│   ├── GC3.ipynb
│   ├── GCContentPlotOrthologusChromosome.R
│   ├── GCCounter.py
│   ├── GCCounter2.py
│   ├── GGPlot2ViolinPlot.R
│   ├── PlotGCRepeats.ipynb
│   ├── README.md
│   ├── SlidingWindowAnalysis.ipynb
│   ├── plot.R
│   └── plot2.R
└── RepeatGC
    ├── LineRegress.R
    ├── PlotGCContentForRepeats.ipynb
    ├── calculate_gc_repeats.py
    ├── check_for_soft_repeatmask.sh
    ├── download_and_extract_genomes.sh
    └── species_list.txt
```
```GCCalc/``` contains scripts to analyze the base composition of genomes by analyzing gc content, ag content, gc skew, and at skew in windows, chromosomes and other features of the genome. Some scripts were based on [WenchaoLin's GCcalc](https://github.com/WenchaoLin/GCcalc).

Run ```GCCounter```

```RepeatGC/``` contains scripts created to compare gc content in repeats and non repeats across species from softmasked genomes from ncbi, or from EarlGrey, the conda library for RepeatMasker.
Running
File Order: ```species_list > download_and_extract_genomes.sh > check_for_soft_repeatmask.sh > calculate_gc_repeats.py > PlotGCContentForRepeats.ipynb and/or LineRegress.R```
```species_list``` is a text file containing the species names and gc contents. I copied and pasted the species I wanted from ncbi by selecting only those two features in the genome search bar.
Make sure to make the ```download_and_extract_genomes.sh and check_for_soft_repeatmask.sh``` scripts executable by running ```chmod +x download_and_extract_genomes.sh``` and ```chmod +x check_for_soft_repeatmask.sh```.
```download_and_extract_genomes.sh``` downloads and extracts the genomes from ncbi using ```species_list``` as input. If downloading issues occur, manually add the genome, or run the script again with a shortened ```species_list```.
```check_for_soft_repeatmask.sh``` outputs whether or not each ```.fna``` file in the directory contains softmasked elements. If the genome does not, either run a repeat masker, or take the genome out of your analysis.
```caclulate_gc_repeats.py``` requires biopython, os, and csv libraries. It outputs ```gc_content_results.csv``` which contains the fields filename, gc in masked, unmasked, and species.
```presentation.pdf``` is a powerpoint presentation showing results of research.

# Highlights
## GCCalc
Using [symgenoevolab](https://github.com/symgenoevolab)'s [SyntenyFinder](https://github.com/symgenoevolab/SyntenyFinder/tree/main), the scripts were used to look for relationships between [ALG ancestral genes of bilaterals](https://www.biorxiv.org/content/10.1101/2024.02.15.580425v1.full) and GC content for *B. floridae, P. maximus, L. longissimus, C. mucedo, M. membranacea*

### Macryosynteny Graph
![alt text](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/bilateralMacrosyntenyGraph.png)

### Sliding Window Analysis
![Sliding Window Analysis of Mme 4](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/membraniporaMembranaceaChromosome4SlidingWindowAnalysis.png)

### Bimodal Distribution of GC Content in *L. longissimus*
While looking at the GC distribution of genes, an interesting observation was a bimodal distribution in *L. longissimus* chromosome 6.

![Bilaterian Chromosomes Violin Plot](https://github.com/Hufamily/GCContent/blob/58613318d5b50a6036e08324033f2a19f07c4d48/images/LloBimodalCircled.png)

Using the sliding window analysis, it was observed that the high GC genes, GC content between 0.5 to 0.6, were concentrated in specific areas.

![Sliding Window Analysis of Llo 6](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/lineusLongissimusChromosome6BimodalDistribution.png)

### Citation
Lewin, T. D., Liao, I. J., Chen, M., Bishop, J. D. D., Holland, P. W. H., & Luo, Y. (2024). ​​Fusion, fission, and scrambling of the bilaterian genome in Bryozoa. bioRxiv (Cold Spring Harbor Laboratory). https://doi.org/10.1101/2024.02.15.580425

## RepeatGC
In each species, the repeat GC seemed to be more extreme, having higher GC in higher GC regions and vice versa, in each window.

![Repeat GC vs GC in Mme](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/membraniporaMembranaceaRepeatGCvsGC.png)

This held true across all species investigated if we took the GC content of the repeatmasked regions in the genome, and the GC content of the non-repeatmasked regions.

![RepeatGC vs GC in Eukaryotes](https://github.com/Hufamily/GCContent/blob/400847a9767401283069d7c35a74717cc1ae0a6f/images/eukaryoteRepeatGCvsGC.png)
