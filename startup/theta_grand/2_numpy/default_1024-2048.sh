qsub --attrs filesystems=home,grand -A catalyst -q default -t 120 -n 1024 ./qsub_theta.sh 1024 1 numpy_1024_01.csv ./numpy.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 120 -n 1024 ./qsub_theta.sh 1024 64 numpy_1024_64.csv ./numpy.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 120 -n 2048 ./qsub_theta.sh 2048 1 numpy_2048_01.csv ./numpy.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 120 -n 2048 ./qsub_theta.sh 2048 64 numpy_2048_64.csv ./numpy.sh
