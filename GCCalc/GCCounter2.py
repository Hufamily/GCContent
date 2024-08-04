#Modified from https://github.com/WenchaoLin/GCcalc/blob/master/GCcalc.py

from __future__ import division
from Bio import SeqIO
import sys
import argparse
import csv
import pandas as pd
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

    usage = "usage: %(prog)s -g genome.fna -a annotation.gtf" 
    parser = argparse.ArgumentParser(description="Calculate the gc content and skew of each chromosome", usage=usage)
    parser.add_argument("-g","--genome",dest="genome",help="Input Fasta format file",metavar="FASTA", required=True)
    parser.add_argument("-a","--annotation",dest="annotation",help="Input GTF format file",metavar="GTF", required=True)
    args = parser.parse_args()

    with open(args.genome, 'r') as file_handle:
        seq_dict = SeqIO.to_dict(SeqIO.parse(file_handle, 'fasta'))
    columns = ["sequence", "source", "feature", "start", "end", "score", "strand", "frame", "attribute"]
    gtf_dataframe = pd.read_csv(args.annotation, sep = '\t', comment = '#', header = None, names = columns, dtype={'start': int, 'end': int})
    gccon = []
    gcsk = []
    atsk = []
    agcon = []
    slen = []
    for index, row in gtf_dataframe.iterrows():
        target_id = row['sequence']
        if target_id in seq_dict:
            target_record = seq_dict[target_id]
            if row['end'] >= len(target_record.seq):
                seq = target_record.seq[(row['start']-1):]
            else:
                seq = target_record.seq[(row['start']-1):row['end']]
            gcc = GC_content_window(seq)
            gcs = GC_skew_window(seq)
            ats = AT_skew_window(seq)
            agc = AG_content_window(seq)
            sl = (len(seq))
            gccon.append(gcc)
            gcsk.append(gcs)
            atsk.append(ats)
            agcon.append(agc)
            slen.append(sl)            
        else:
            gccon.append(None)
            gcsk.append(None)
            atsk.append(None)
            agcon.append(None)
            slen.append(None)
            print(f"No record found with ID {target_id}")

        
    gtf_dataframe = gtf_dataframe.assign(gccontent = gccon)
    gtf_dataframe = gtf_dataframe.assign(gcskew = gcsk)
    gtf_dataframe = gtf_dataframe.assign(atskew = atsk)
    gtf_dataframe = gtf_dataframe.assign(agcontent = agcon)
    gtf_dataframe = gtf_dataframe.assign(seqlen = slen)
    
    csv_file_path = args.annotation+'.csv'
    gtf_dataframe.to_csv(csv_file_path, index = False)

if __name__ == '__main__':
    main()
    sys.exit()