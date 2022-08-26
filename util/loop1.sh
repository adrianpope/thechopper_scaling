#! /bin/bash
echo ${BASH_VERSION}
n=$1
for i in $(seq 1 1 $n)
do
    echo $i
done
