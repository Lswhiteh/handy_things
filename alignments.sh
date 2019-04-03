#!usr/bin/bash


for f in `ls ~/Obeseperm/*.fastq | cut -f1,2,3 -d'_'`
do
	echo $f
	bwa mem hg19ref.fasta ${f}_R1_001.fastq ${f}_R2_001.fastq > ${f}.sam


done
