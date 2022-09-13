#! /bin/bash

MY_ENV=alltoall
DST_TOP_DIR=/local/scratch
source ${DST_TOP_DIR}/${MY_ENV}/bin/activate

python3 -c "from mpi4py import MPI"
