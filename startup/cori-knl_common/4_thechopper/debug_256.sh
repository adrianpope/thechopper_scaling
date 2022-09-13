sbatch -C knl -A m4075 -q debug -t 10 -N 256 ./sbatch_cori-knl.sh 256 1 thechopper_0256_01.csv ./thechopper.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 256 ./sbatch_cori-knl.sh 256 68 thechopper_0256_68.csv ./thechopper.sh
