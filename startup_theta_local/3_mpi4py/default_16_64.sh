qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 16 1 mpi4py_0016_01 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 16 64 mpi4py_0016_64 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 32 1 mpi4py_0032_01 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 32 64 mpi4py_0032_64 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 64 1 mpi4py_0064_01 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 64 64 mpi4py_0064_64 ./mpi4py.sh
