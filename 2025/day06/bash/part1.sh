xargs -n1 < ../input.txt | pr -ts' ' --columns=$(wc -l < ../input.txt) -l$(head -1 ../input.txt | wc -m) | sed -E 's/(.*) (.)/echo "\1" | sed "s# # \2 #g" | bc/e' | paste -sd'+' | bc
