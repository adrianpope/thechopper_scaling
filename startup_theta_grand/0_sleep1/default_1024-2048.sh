qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 1024 ./qsub_theta.sh 1024 1 sleep1_1024_01.csv ./sleep1.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 1024 ./qsub_theta.sh 1024 64 sleep1_1024_64.csv ./sleep1.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 2048 ./qsub_theta.sh 2048 1 sleep1_2048_01.csv ./sleep1.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 2048 ./qsub_theta.sh 2048 64 sleep1_2048_64.csv ./sleep1.sh
