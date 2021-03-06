#!/usr/bin/env bash
BBSHOME=${BBSHOME:-"/home/bbs"}
declare -i a
declare -i b
cd "${BBSHOME}/run" || exit 1
if (test -e NOACCT.log); then
    rm NOACCT.log
fi
cd "${BBSHOME}/usr" || exit 1
for i in a b c d e f g h i j k l m n o p q r s t u v w x y z; do
    cd "${BBSHOME}/usr/$i" || continue
    for usr in */; do
        cd "${BBSHOME}/usr/$i/$usr" || continue
        if ! (test -e .ACCT); then
            echo "$usr" >> "${BBSHOME}/run/NOACCT.log"
            let a++
        fi
        let b++
    done
done
echo "$a user(s) have no ACCT" >> "${BBSHOME}/run/NOACCT.log"
echo "$b user(s) is checked" >> "${BBSHOME}/run/NOACCT.log"
#mail -s 'NOACCT.log' *********@gmail.com < "${BBSHOME}/NOACCT.log"
#rm "${BBSHOME}/NOACCT.log"
