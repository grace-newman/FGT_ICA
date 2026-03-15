#!/bin/bash

#######################################################################################

# B282025
# 25 March 2026

# This is a script file containing the commands used for the Unix Part of
# the Functional Genomic Technologies ICA

# Commands that have already been completed by the instructor (Simon) are
# commented out

######################################################################################


# Download the sequence data for each sample
# (this has already been completed by Simon and is shown for information only)
# The fasterq-dump command takes a sample accession number, downloads the data and outputs it to the specified location
# There are 12 files because my study was done using paired end reads
# Reference: Code was modified from the ICA instructions handout and from
# https://github.com/ncbi/sra-tools/wiki/08.-prefetch-and-fasterq-dump

# Example:
# prefetch SRR29208249
# fasterq-dump SRR29208249 -O ~/FGT/ICA/GSE267325/fastq --split-files

# The fastq files were archived and compressed
# (this has already been completed by Simon and is shown for information only)
#cd ./fastq
#tar -cfz GSE267325.tar *.fastq

# Run FastQC on the download
# (this has already been completed by Simon and is shown for information only)
# Reference: Code was taken from the ICA instructions handout
# This code generates a QC report for each sample and places is in the fastqc folder

#cd ..
#fastqc --nogroup -o fastqc ./fastq/*.fastq

# Run MultiQC
multiqc -n GSE267325_multiqc_report ./fastqc

# MultiQC report indicates quality concerns (see report for more detail)
# Simon has already trimmed the data for me using Trimmomatic
# Trimmed data has been written to the folder fastq_tr
# FastQC report data has been placed in the fastqc_tr

# Run MultiQC on the trimmed data
multiqc -n GSE267325_multiqc_tr_report ./fastqc_tr

# Aligning the sequqnce reads to the genome
# (this has already been completed by Simon and is shown for information only)
# Reference: Code has been taken from the ICA insturctions handout
# If I was actually running this script I would need to change or define the ${STUDY}
# and ${F} variables to match my study and sample accession numbers

#  STAR --runThreadN 10 \
#	--sjdbOverhang 49 \
#	--sjdbGTFfile ../annot/Mus_musculus.GRCm39.113.gtf \
#	--genomeDir ../genome_star \
#	--readFilesIn ../${STUDY}/fastq/${F}_1.fastq
#	../${STUDY}/fastq/${F}_2.fastq \
#	--outSAMtype BAM SortedByCoordinate \
#	--outFileNamePrefix ../${STUDY}/alignment/${F}

# Counting and Mapping to the Gene Models
# (this has already been completed by Simon using an R script and the snippet below
# is shown for information only)
# Reference: Code has been taken from the ICA insturctions handout

#mytable_feaures <-featureCounts(files=alignment_files, annot.ext=annot,
#isGTFAnnotationFile = TRUE,
#isPairedEnd =T,
#countMultiMappingReads=F,
#minMQS=30,
#nthreads=10,
#minOverlap=10)
#save(mytable_feaures,file=paste0(study,"/mytable_feaures"))

# Run MultiQC on the trimmed data with alignment statistics
multiqc -n GSE267325_multiqc_tr_al_report ./fastqc_tr ./alignment
