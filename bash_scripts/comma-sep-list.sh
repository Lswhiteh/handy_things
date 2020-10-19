#Creates comma separated list of entries that match the grep, in this case it's for NGS read filenames
ls -p | grep R2 | tr '\n' ','
