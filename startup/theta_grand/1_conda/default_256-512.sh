qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 256 ./qsub_theta.sh 256 1 conda_0256_01.csv ./conda.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 256 ./qsub_theta.sh 256 64 conda_0256_64.csv ./conda.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 512 ./qsub_theta.sh 512 1 conda_0512_01.csv ./conda.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 512 ./qsub_theta.sh 512 64 conda_0512_64.csv ./conda.sh
