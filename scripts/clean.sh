#!/usr/bin/env bash
BBSHOME=${BBSHOME:-"/home/bbs"}
declare -i a
#declare -i b
#declare -i c
cd "${BBSHOME}/brd" || exit 1
for file in */; do
    cd "${BBSHOME}/brd/$file" || continue
    if (test -e usies); then
        rm -f usies
        let a++
    fi
#    if (test -e brdstat); then
#        rm -f brdstat
#        let b++
#    fi
#    if (test -e bstatcount); then
#        rm -f bstatcount
#        let c++
#    fi
done
echo "clean $a board usies"
#echo "clean $b board brdstat"
#echo "clean $c board bstatcount"
