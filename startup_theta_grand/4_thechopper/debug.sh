qsub --attrs filesystems=home,grand -A catalyst -q debug-cache-quad -t 10 -n 1 ./qsub_theta.sh 1 1 thechopper_0001_01.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q debug-cache-quad -t 10 -n 1 ./qsub_theta.sh 1 64 thechopper_0001_64.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q debug-cache-quad -t 10 -n 2 ./qsub_theta.sh 2 1 thechopper_0002_01.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q debug-cache-quad -t 10 -n 2 ./qsub_theta.sh 2 64 thechopper_0002_64.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q debug-cache-quad -t 10 -n 4 ./qsub_theta.sh 4 1 thechopper_0004_01.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q debug-cache-quad -t 10 -n 4 ./qsub_theta.sh 4 64 thechopper_0004_64.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q debug-cache-quad -t 10 -n 8 ./qsub_theta.sh 8 1 thechopper_0008_01.csv ./thechopper.sh
qsub --attrs filesystems=home,grand -A catalyst -q debug-cache-quad -t 10 -n 8 ./qsub_theta.sh 8 64 thechopper_0008_64.csv ./thechopper.sh
