# Thanks to https://github.com/DezlLab for the idea behind this solution!
bash -c "paste -d* \
    <(paste -d+ \
        <(tr '@.' '10' < \"\$1\" | fold -w1) \
        <(tr '@.' '10' < \"\$1\" | sed 's/^.//;s/\$/0/' | fold -w1) \
        <(tr '@.' '10' < \"\$1\" | sed 's/.$//;s/^/0/' | fold -w1) \
        <(cat <(sed 's/./0/g;1q' \"\$1\") <(tr '@.' '10' < \"\$1\" | head -n -1) | fold -w1) \
        <(cat <(sed 's/./0/g;1q' \"\$1\") <(tr '@.' '10' < \"\$1\" | head -n -1) | sed 's/^.//;s/\$/0/' | fold -w1) \
        <(cat <(sed 's/./0/g;1q' \"\$1\") <(tr '@.' '10' < \"\$1\" | head -n -1) | sed 's/.$//;s/^/0/' | fold -w1) \
        <(cat <(tr '@.' '10' < \"\$1\" | tail -n +2) <(sed 's/./0/g;1q' \"\$1\") | fold -w1) \
        <(cat <(tr '@.' '10' < \"\$1\" | tail -n +2) <(sed 's/./0/g;1q' \"\$1\") | sed 's/^.//;s/\$/0/' | fold -w1) \
        <(cat <(tr '@.' '10' < \"\$1\" | tail -n +2) <(sed 's/./0/g;1q' \"\$1\") | sed 's/.$//;s/^/0/' | fold -w1) \
        | bc) \
    <(tr '@.' '10' < \"\$1\" | fold -w1) \
    | bc | grep -c '[1-4]'" _ ../input.txt