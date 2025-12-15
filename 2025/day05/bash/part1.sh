for n in $(grep -v - ../input.txt | tail -n +2); do grep - ../input.txt | paste -sd\| | sed "s/|/ | /g;s/-/ < $n \& $n < /g" | xargs expr; done | grep -c 1
