#! /bin/bash

if [ $# -lt 4 ]
then
    echo "USAGE: sbatch -C knl -N <NODES_JOB> -t <TIME> -A <PROJECT> -q <QUEUE> $0 <NODES_RUN> <RPN> <OUTNAME> <CMD_STR>"
    exit -1
fi

NODES_RUN=$1
RPN=$2
OUTNAME=$3
CMD_STR=$4

RANKS=$((${NODES_RUN}*${RPN}))
HW_THREADS_PER_RANK=$((272/${RPN}))

echo -n "${NODES_RUN}, ${RPN}, " > ${OUTNAME}
CMD="srun -n ${RANKS} -c ${HW_THREADS_PER_RANK} ${CMD_STR}"
echo ${CMD}
/usr/bin/time -f "%e" ${CMD} 2>> ${OUTNAME}
