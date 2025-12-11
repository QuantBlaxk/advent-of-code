tr ',' '\n' < ../input.txt | while IFS='-' read s e; do seq "$s" "$e"; done | grep -E '^([0-9]+)\1$' | paste -sd+ | bc
