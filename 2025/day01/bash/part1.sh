sed 's/L/-/g;s/R/+/g' ../input.txt | awk 'BEGIN{s=50} {s += $0; print s % 100}' | grep -c ^0$
