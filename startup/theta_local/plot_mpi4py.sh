#! /bin/bash

python3 ./plot.py mpi4py "from mpi4py import MPI" \
	mpi4py_01.csv "Theta/SSD (1 RPN)" \
	mpi4py_64.csv "Theta/SSD (64 RPN)"
