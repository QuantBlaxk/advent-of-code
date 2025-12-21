I=$(mktemp) \
&& cat ../input.txt > "$I" \
&& W=$(head -1 "$I" | tr -d '\n' | wc -c) \
&& f() ( O=$(paste -d* \
                <(paste -d+ \
                    <(tr '@.' '10' < "$I" | sed 's/^.//;s/$/0/' | fold -w1) \
                    <(tr '@.' '10' < "$I" | sed 's/.$//;s/^/0/' | fold -w1) \
                    <(cat <(sed 's/./0/g;1q' "$I") <(tr '@.' '10' < "$I" | head -n -1) | fold -w1) \
                    <(cat <(sed 's/./0/g;1q' "$I") <(tr '@.' '10' < "$I" | head -n -1) | sed 's/^.//;s/$/0/' | fold -w1) \
                    <(cat <(sed 's/./0/g;1q' "$I") <(tr '@.' '10' < "$I" | head -n -1) | sed 's/.$//;s/^/0/' | fold -w1) \
                    <(cat <(tr '@.' '10' < "$I" | tail -n +2) <(sed 's/./0/g;1q' "$I") | fold -w1) \
                    <(cat <(tr '@.' '10' < "$I" | tail -n +2) <(sed 's/./0/g;1q' "$I") | sed 's/^.//;s/$/0/' | fold -w1) \
                    <(cat <(tr '@.' '10' < "$I" | tail -n +2) <(sed 's/./0/g;1q' "$I") | sed 's/.$//;s/^/0/' | fold -w1) \
                    | bc) \
                <(tr '@.' '10' < "$I" | fold -w1) \
                | bc | sed -e 's/[0-3]/\./g' -e 's/[4-9]/@/g' \
                | xargs -n "$W" | tr -d ' ') \
&& cmp -s "$I" <(echo "$O") || ( echo "$O" > "$I" && f ) ) \
&& f \
&& echo $(( $(grep -o '@' ../input.txt | wc -l) - $(grep -o '@' "$I" | wc -l) ))