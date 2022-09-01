#! /bin/bash

if [ $# -lt 4 ]
then
    echo "USAGE: qsub -n <NODES_JOB> -t <TIME> -A <PROJECT> -q <QUEUE> $0 <NODES_RUN> <RPN> <OUTNAME> <CMD_STR>"
    exit -1
fi

NODES_RUN=$1
RPN=$2
OUTNAME=$3
CMD_STR=$4

RANKS=$((${NODES_RUN}*${RPN}))

echo -n "${NODES_RUN}, ${RPN}, " > ${OUTNAME}
/usr/bin/time -f "%e" aprun -n ${RANKS} -N ${RPN} -d 1 -j 1 -cc depth ${CMD_STR} 2>> ${OUTNAME}
