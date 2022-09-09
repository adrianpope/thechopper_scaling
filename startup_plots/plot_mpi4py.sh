#! /bin/bash

python3 ./plot.py mpi4py "from mpi4py import MPI" \
	../startup_theta_grand/mpi4py_01.csv "Theta/grand (1 RPN)" \
	../startup_theta_grand/mpi4py_64.csv "Theta/grand (64 RPN)" \
	../startup_cori-knl_common/mpi4py_01.csv "Cori-KNL/common (1 RPN)" \
	../startup_cori-knl_common/mpi4py_68.csv "Cori-KNL/common (68 RPN)" \
	../startup_theta_local/mpi4py_01.csv "Theta/SSD (1 RPN)" \
	../startup_theta_local/mpi4py_64.csv "Theta/SSD (64 RPN)"
