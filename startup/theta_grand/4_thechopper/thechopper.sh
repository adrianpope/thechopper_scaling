#! /bin/bash

source miniconda3.sh
conda activate alltoall
python3 -c "import sys,numpy,numpy.random,thechopper,thechopper.data_chopper; from mpi4py import MPI; from common import *"
