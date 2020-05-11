cat testfile.tree | sed -e 's/\,/\,\n/g' | sed -e 's/prot.*:/prot:/' | tr -d '\n' > cleaned_testfile.tree
