qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 128 1 mpi4py_0128_01 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 128 64 mpi4py_0128_64 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 256 ./qsub_theta.sh 256 1 mpi4py_0256_01 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 256 ./qsub_theta.sh 256 64 mpi4py_0256_64 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 512 ./qsub_theta.sh 512 1 mpi4py_0512_01 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 512 ./qsub_theta.sh 512 64 mpi4py_0512_64 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 1024 ./qsub_theta.sh 1024 1 mpi4py_1024_01 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 1024 ./qsub_theta.sh 1024 64 mpi4py_1024_64 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 2048 ./qsub_theta.sh 2048 1 mpi4py_2048_01 ./mpi4py.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 2048 ./qsub_theta.sh 2048 64 mpi4py_2048_64 ./mpi4py.sh