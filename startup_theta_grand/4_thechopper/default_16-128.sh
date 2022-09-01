qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 16 1 thechopper_0016_01.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 16 64 thechopper_0016_64.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 32 1 thechopper_0032_01.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 32 64 thechopper_0032_64.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 64 1 thechopper_0064_01.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 64 64 thechopper_0064_64.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 128 1 thechopper_0128_01.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 128 ./qsub_theta.sh 128 64 thechopper_0128_64.csv ./thechopper.sh
