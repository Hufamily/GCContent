#!/bin/bash

# File containing the list of taxids and corresponding species names
taxid_file="species_list.txt"

# Read the taxids and species names from the file
while read species_name taxid gc; do
    # Download only the reference genome for each taxid
    if [ -z "$species_name" ] || [[ "$species_name" =~ ^# ]]; then
        echo "Skipped Line"
        continue
    fi

    datasets download genome taxon $taxid --include genome --assembly-source refseq --filename "${taxid}_genome.zip"
    
    if [ $? -ne 0 ]; then
        datasets download genome taxon $taxid --include genome --assembly-source genbank --filename "${taxid}_genome.zip"
    fi

    if [ $? -ne 0 ]; then
        echo "Failed to download genome for taxid $taxid"
        continue
    fi

    # Unzip the downloaded file
    unzip -o "${taxid}_genome.zip" -d "${taxid}_genome"

    # Find the genome file and rename it based on the species name
    genome_file=$(find "${taxid}_genome" -name "*.fna" | head -n 1)
    
    if [ -n "$genome_file" ]; then
        mv "$genome_file" "./${species_name}.fna"
    else
        echo "No genome file found for taxid $taxid"
    fi

    # Cleanup
    rm -rf "${taxid}_genome"
    rm "${taxid}_genome.zip"
done < $taxid_file
