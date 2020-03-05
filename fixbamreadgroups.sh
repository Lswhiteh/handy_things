module load bwa picard gatk

cd /pine/scr/l/s/lswhiteh/yeast_hybrids/fastas/abbababba/reads


for f in ../*.bam
do
        echo $f
        id=$(echo $f | awk '{split($0, id, /.bam/); print id[1]}')
        echo $id
        picard AddOrReplaceReadGroups \
                I= ${f} \
                O= ${id}.rg.bam \
                RGID= ${id}sranum \
                RGLB= ${id}sralib \
                RGPL= illumina \
                RGPU= ${id}srabar \
                RGSM= ${id}sranum
done
