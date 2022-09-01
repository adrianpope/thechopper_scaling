#! /bin/bash

source miniconda3.sh
conda activate alltoall
python3 -c "from mpi4py import MPI"
