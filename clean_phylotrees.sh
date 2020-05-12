#Unwraps tree by commas and end parens, then removes all inserted IDs by orthofinder for each line, wraps back up into completed tree
for f in *fa.treefile; do cat ${f} | sed -e 's/\,/\,\n/g'| sed -e 's/)/)\n/g' | sed -e 's/_sp.*:/:/' | sed -e 's/prot.*:/prot:/' | sed -e 's/_tr.*:/:/' |  tr -d '\n' > ${f}.trimmed; done

