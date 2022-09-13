qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 256 ./qsub_theta.sh 256 1 thechopper_0256_01.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 256 ./qsub_theta.sh 256 64 thechopper_0256_64.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 512 ./qsub_theta.sh 512 1 thechopper_0512_01.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q default -t 30 -n 512 ./qsub_theta.sh 512 64 thechopper_0512_64.csv ./thechopper.sh
