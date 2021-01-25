# KRAKEN2-BRACKEN
Updated KRAKEN2+BRACKEN Docker image with the newest version of Kraken (to escape rsync problem when downloading the libraries)


Kraken is a taxonomic sequence classifier that assigns taxonomic labels to DNA sequences.
As suggested elsewhere by the developers, it is better to make a custom library in any case. 

Bracken (Bayesian Reestimation of Abundance with KrakEN) is a highly accurate statistical method that computes the abundance of species in DNA sequences from a metagenomics sample. Braken uses the taxonomy labels assigned by Kraken,
a highly accurate metagenomics classification algorithm, to estimate the number of reads originating from each species present in a sample. This dockerfile contains instructions for installation of all the prerequisits for Bracken, incl Bracken itself. Includes Kraken.

To run paired-end .fastq-s:
```
kraken2 --db $YOUR_DB --paired --classified-out $NAME#.fastq --unclassified-out $NAME#.fastq --output $NAME.tsv --report  $NAME.tsv --use-names  --threads 30  $1.fastq $2.fastq
```
