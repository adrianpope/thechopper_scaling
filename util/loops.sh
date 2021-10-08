#! /bin/bash
max=$1
i=1
while [ $i -le $max ]
do
    echo node $i
    for rpn in 1 4 16 64
    do
	echo rpn $rpn
    done
    i=$(($i*2))
done
