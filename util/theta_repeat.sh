#! /bin/bash

repeat=$1
rpn=$2
tsleep=$3

nodes=$COBALT_JOBSIZE
ranks=$((nodes*rpn))

for i in $(seq 1 1 $repeat)
do
    aprun -n $ranks -N $rpn -d 1 -j 1 -cc depth python mpi4py_startup_time.py $nodes
    sleep $tsleep
done
