grep - input.txt | sort -t- -k1,1n -k2,2n |
awk -F- 'NR==1 { s=$1; e=$2; next } $1<=e+1 { if($2>e)e=$2; next } { t+=e-s+1; s=$1; e=$2 } END{ print t+e-s+1 }'
