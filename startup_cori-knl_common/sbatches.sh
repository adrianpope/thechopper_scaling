#! /bin/bash

RUNQ=false
if [ $# -lt 8 ]
then
    echo "USAGE: $0 <PROJECT> <QUEUE> <MIN_NODE_JOB> <EXE> <OUTBASE> <NODE_RUN_LIST> <RPN_LIST> <TIME>"
    exit -1
fi

PROJECT=$1
QUEUE=$2
MIN_NODE_JOB=$3
EXE=$4
OUTBASE=$5
NODE_RUN_LIST=$6
RPN_LIST=$7
TIME=$8

for NODE_RUN in ${NODE_RUN_LIST}
do
    NODE_JOB=${NODE_RUN}
    if [ ${NODE_JOB} -lt ${MIN_NODE_JOB} ]
    then
	NODE_JOB=${MIN_NODE_JOB}
    fi
    for RPN in ${RPN_LIST}
    do
	OUTNAME=${OUTBASE}_`printf %04d ${NODE_RUN}`_`printf %02d ${RPN}`.csv
	CMD="sbatch -C knl -A ${PROJECT} -q ${QUEUE} -t ${TIME} -N ${NODE_JOB} ./sbatch_cori-knl.sh ${NODE_RUN} ${RPN} ${OUTNAME} ${EXE}"
	echo ${CMD}
	if ${RUNQ}
	then
	    ${CMD}
	fi
    done
done
