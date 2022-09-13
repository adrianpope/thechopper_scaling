#! /bin/bash

LOG_FILE=/dev/null
if [ $# -ge 1 ]
then
    LOG_FILE=$(realpath $1)
fi

MPIBCP=../mpibcp
MY_ENV=alltoall
SRC_TOP_DIR=..
DST_TOP_DIR=/local/scratch

TARBALL=${MY_ENV}.tar.gz

mkdir -p ${DST_TOP_DIR}/${MY_ENV}
${MPIBCP} ${SRC_TOP_DIR}/${TARBALL} ${DST_TOP_DIR}/${TARBALL} > ${LOG_FILE}
cd ${DST_TOP_DIR}
tar -zxf ${TARBALL} -C ${MY_ENV}
source ${MY_ENV}/bin/activate
conda-unpack
