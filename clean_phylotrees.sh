for f in *.fa.treefile; do cat ${f} | sed -e 's/\,/\,\n/g' | sed -e 's/_sp.*:/:/' | sed -e 's/prot.*:/prot:/' | sed -e 's/_tr.*:/:/' |  tr -d '\n' > ${f}.trimmed; done

