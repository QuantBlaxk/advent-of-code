while IFS= read -r line; do
  max=$(echo $line | fold -w1 | head -n -1| sort -nr | head -n1)
  printf $max
  sed -n "s/^[^${max}]*\(${max}.*\)/\1/p" <<< $line | fold -w1 | tail -n +2 | sort -nr | head -1
done < ../input.txt | paste -sd+ | bc
