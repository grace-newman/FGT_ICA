#!/home/s2823303/FGT/ICA/GSE267325/FGT_ICA_env/bin/python

#############################################################################

# Written by B282025
# 25 March 2026

# A script to summaraize the results from the blast search on overrepresnted
# sequences found during MultiQC analysis of the trimmed and untrimmed
# RNA-seq data

# Reference: Code adapted from Bioinformatics Programming and System
# Management Lecture 17

############################################################################

import pandas as pd

df = pd.read_csv("overrep_blast.out", sep="\t")

print("\nTop HSPs for the Overrrepresented Untrimmed Sequences:\n")
print(df.iloc[:,-1])

df_tr = pd.read_csv("overrep_tr_blast.out", sep="\t")

print("\nTop HSPs for the Overrrepresented Trimmed Sequences:\n")
print(df_tr.iloc[:,-1])
