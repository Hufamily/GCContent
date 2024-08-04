from Bio import SeqIO
import sys
import argparse
import pandas as pd

def main():

    usage = "usage: %(prog)s -f input.fa -i #" 
    parser = argparse.ArgumentParser(description="Calculate the length of each chromosome", usage=usage)
    parser.add_argument("-f","--file",dest="filename",help="Input Fasta format file",metavar="FASTA", required=True)
    parser.add_argument("-i","--integer", type=int, dest="count",help="Input number of scaffolds to output",metavar="INTEGER", required=True)
    args = parser.parse_args()

    records = SeqIO.parse(args.filename, 'fasta')
    data = [(record.id, str(record.seq), len(record.seq)) for record in records]
    seqobj = pd.DataFrame(data, columns=['id', 'seq', 'seqlen'])
    seqobj = seqobj.sort_values('seqlen', ascending=False).head(int(args.count))
    
    for row in seqobj.itertuples(index=False): 
        print(row.seqlen)

if __name__ == '__main__':
    main()
    sys.exit()