#!usr/bin/bash

#Iterate over fastq files, cut out the sections that come before R1/R2
for f in `ls ~/FASTQS/*.fastq | cut -f1,2,3 -d'_'`
do
	echo $f
	#Can use any aligner, but file handling consistent across
	bwa mem hg19ref.fasta ${f}_R1_001.fastq ${f}_R2_001.fastq > ${f}.sam


done
