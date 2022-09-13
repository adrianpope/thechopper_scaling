qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 16 1 conda_0016_01.csv ./conda.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 16 64 conda_0016_64.csv ./conda.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 32 1 conda_0032_01.csv ./conda.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 32 64 conda_0032_64.csv ./conda.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 64 1 conda_0064_01.csv ./conda.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 64 64 conda_0064_64.csv ./conda.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 128 1 conda_0128_01.csv ./conda.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 128 64 conda_0128_64.csv ./conda.sh
