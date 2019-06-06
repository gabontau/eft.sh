#!/bin/bash

#22:37 - 23:32
#Semen Alexandrovich Lyhin
#Why do I need this script?

if [ $# -ne 2 ]; then
    echo "Usage: $0 <file> <how_much_b64_lines_per_echo>"
    echo "Example: $0 /usr/share/windows-binaries/nc.exe 32 | leafpad"

else
    base64 $1 > temp.txt
    count=$(wc -l temp.txt | cut -d" " -f1)
    iter=0
    echo -n "echo "
    for l in $(cat temp.txt); do
        iter=$((iter+1))
        if [ `expr $iter % $2` -eq 0 ]; then
            echo "$l >> out.txt"
            echo "clear"
            echo "echo [$iter/$count]"
            echo -n "echo "
        else 
            echo -n "$l"
        fi
    done;
    echo " >> out.txt"
fi

