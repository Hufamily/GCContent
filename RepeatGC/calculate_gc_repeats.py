import os
from Bio import SeqIO
import csv

def calculate_GC_content(sequence):
    """Calculate GC content of a DNA sequence."""
    gc_count = sequence.count('G') + sequence.count('C')
    seqlen = sequence.count('G') + sequence.count('C') + sequence.count('A') + sequence.count('T')
    if seqlen == 0:
        return 0
    return gc_count / seqlen * 100

def calculate_gc_content(sequence):
    """Calculate GC content of a DNA sequence."""
    gc_count = sequence.count('g') + sequence.count('c')
    seqlen = sequence.count('g') + sequence.count('c') + sequence.count('a') + sequence.count('t')
    if seqlen == 0:
        return 0
    return gc_count / seqlen * 100

def calculate_GC_Content(sequence):
    """Calculate GC content of a DNA sequence."""
    gc_count = sequence.count('G') + sequence.count('C') + sequence.count('g') + sequence.count('c')
    seqlen = sequence.count('G') + sequence.count('C') + sequence.count('A') + sequence.count('T') + sequence.count('g') + sequence.count('c') + sequence.count('a') + sequence.count('t')
    if seqlen == 0:
        return 0
    return gc_count / seqlen * 100

def output_to_csv(results, csv_filename):
    """Output results to a CSV file."""
    with open(csv_filename, mode='w', newline='') as file:
        fieldnames = ['filename', 'masked_gc_content', 'unmasked_gc_content', 'gc_content']
        writer = csv.DictWriter(file, fieldnames=fieldnames)
        writer.writeheader()
        for row in results:
            writer.writerow(row)

def process_fna_files(directory):
    """Process .fna files in a directory."""
    results = []
    for filename in os.listdir(directory):
        if filename.endswith(".fna"):
            filepath = os.path.join(directory, filename)
            with open(filepath, "r") as file:
                sequences = SeqIO.parse(file, "fasta")
                sequence = ""
                for record in sequences:
                    sequence = sequence + str(record.seq)
                #masked_gc_content = calculate_gc_content(''.join([c for c in sequence if c.islower()]))
                #unmasked_gc_content = calculate_GC_content(''.join([c for c in sequence if c.isupper()]))
                masked_gc_content = calculate_gc_content(sequence)
                unmasked_gc_content = calculate_GC_content(sequence)
                gc_content = calculate_GC_Content(sequence)
                results.append({
                    'filename': filename,
                    'masked_gc_content': masked_gc_content,
                    'unmasked_gc_content': unmasked_gc_content,
                    'gc_content': gc_content
                })
    return results
directory_path = './'
csv_output_path = 'gc_content_results.csv'
results = process_fna_files(directory_path)
output_to_csv(results, csv_output_path)
