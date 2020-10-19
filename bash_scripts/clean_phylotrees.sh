#Unwraps tree by commas and end parens, then removes all inserted IDs by orthofinder for each line, wraps back up into completed tree
for f in *fa.treefile; do cat ${f} | sed -e 's/\,/\,\n/g'| sed -e 's/)/)\n/g' | sed -e 's/_sp.*:/:/' | sed -e 's/prot.*:/prot:/' | sed -e 's/_tr.*:/:/' |  tr -d '\n' > ${f}.trimmed; done

#Unwraps to get names on each line, gets number of duplicate species (paralog entries) 
for f in ./*trimmed
do
        if [[ $(cat ${f} | \
                sed -e 's/\,/\,\n/g' | \
                sed -e 's/)/\n/g' | \
                sed -e 's/(/\n/g' | \
                sed -e 's/:/\n/' | \
                sed -e '/[0-9]/d' | \
                sed -e '/\;/d' | \
                sed -e '/^$/d' | \
                sort | uniq -c | \
                sort -nr | \
                awk 'NR==1{ print $1; }') == '1' ]];

        then

                cp ${f} ../no_paras

        fi

done

