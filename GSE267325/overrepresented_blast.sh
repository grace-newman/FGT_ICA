#!/bin/bash

# A script to perform BLAST searches on the overrepresented sequences from MultiQC Analysis

# Reference: Code modifiied from Bioinformatics Programming and Systems Management Lecture 6 & Lecture 20
# Reference: https://www.ncbi.nlm.nih.gov/books/NBK279690/
# Reference: Display BLAST search results with custom output format (https://www.ncbi.nlm.nih.gov/books/NBK569862/)


blastn -db core_nt -query overrepresented.fasta \
-remote \
-max_target_seqs 5 \
-outfmt "6 qseqid sseqid pident evalue bitscore stitle" \
> overrep_blast.out

blastn -db core_nt -query overrepresented_tr.fasta \
-remote \
-max_target_seqs 5 \
-outfmt "6 qseqid sseqid pident evalue bitscore stitle" \
> overrep_tr_blast.out
