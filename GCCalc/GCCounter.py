#Modified from https://github.com/WenchaoLin/GCcalc/blob/master/GCcalc.py

from __future__ import division
from Bio import SeqIO
import sys
import argparse
import csv

def GC_content_window(s):
    
    """
    Return GC content of input sequence
    """

    gc = sum(s.count(x) for x in ['G','C','g','c','S','s'])
    gc_content = gc/float(len(s))
    return round(gc_content,4) 

def GC_skew_window(s):
    
    """
    Return GC skew of a sequence
    """

    g = s.count('G')+s.count('g')
    c = s.count('C')+s.count('c')

    try:
        skew = (g-c)/float(g+c)
    except ZeroDivisionError:
        skew = 0
    return round(skew,4)

def AT_skew_window(s):
    
    """
    Return GC skew of a sequence
    """

    a = s.count('A')+s.count('a')
    t = s.count('T')+s.count('t')

    try:
        skew = (a-t)/float(a+t)
    except ZeroDivisionError:
        skew = 0
    return round(skew,4)

def AG_content_window(s):

    """
    Return AG content of a sequence
    """
    
    ag = sum(s.count(x) for x in ['A','G','a','g'])
    ag_content = ag/float(len(s))
    return round(ag_content,4)

def main():

    """
    Calculate GC content and GC skew of input Fasta sequence
    """

    usage = "usage: %(prog)s -f input.fa" 
    parser = argparse.ArgumentParser(description="Calculate the gc content and skew of each chromosome", usage=usage)
    parser.add_argument("-f","--file",dest="filename",help="Input Fasta format file",metavar="FASTA", required=True)
    args = parser.parse_args()

    seqobj = SeqIO.parse(args.filename,'fasta')
  
    data = [['name', 'description', 'gccontent', 'gcskew', 'atskew', 'agcontent', 'seqlen']]
  
    for record in seqobj: 
        name = record.id
        descriptor = record.description
        seq = record.seq
        gcc = GC_content_window(seq)
        gcs = GC_skew_window(seq)
        ats = AT_skew_window(seq)
        agc = AG_content_window(seq)
        sl = (len(seq))
        data.append([name, descriptor, gcc, gcs, ats, agc, sl])

    csv_file_path = args.filename+'.csv'
 
    # Open the file in write mode
    with open(csv_file_path, mode='w', newline='') as file:
        # Create a csv.writer object
        writer = csv.writer(file)
        # Write data to the CSV file
        writer.writerows(data)

    # Print a confirmation message
    print(f"CSV file '{csv_file_path}' created successfully.")

if __name__ == '__main__':
    main()
    sys.exit()