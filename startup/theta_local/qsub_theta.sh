#! /bin/bash

if [ $# -lt 4 ]
then
    echo "USAGE: qsub -n <NODES_JOB> -t <TIME> -A <PROJECT> -q <QUEUE> $0 <NODES_RUN> <RPN> <OUTBASE> <CMD_STR>"
    exit -1
fi

NODES_RUN=$1
RPN=$2
OUTBASE=$3
CMD_STR=$4

NODES_JOB=${COBALT_JOBSIZE}

RANKS=$((${NODES_RUN}*${RPN}))

OUTNAME=${OUTBASE}.csv
LOGNAME=${OUTBASE}.log

echo -n "${NODES_RUN}, ${RPN}, " > ${OUTNAME}
/usr/bin/time -f "%e" aprun -n ${NODES_JOB} -N 1 -d 1 -j 1 -cc depth ./conda-unpack.sh ${LOGNAME} 2>&1 >/dev/null | tr -d '\n' >> ${OUTNAME}
echo -n ", " >> ${OUTNAME}
/usr/bin/time -f "%e" aprun -n ${RANKS} -N ${RPN} -d 1 -j 1 -cc depth ${CMD_STR} 2>> ${OUTNAME}
