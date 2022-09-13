sbatch -C knl -A m4075 -q debug -t 10 -N 1 ./sbatch_cori-knl.sh 1 1 thechopper_0001_01.csv ./thechopper.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 1 ./sbatch_cori-knl.sh 1 68 thechopper_0001_68.csv ./thechopper.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 2 ./sbatch_cori-knl.sh 2 1 thechopper_0002_01.csv ./thechopper.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 2 ./sbatch_cori-knl.sh 2 68 thechopper_0002_68.csv ./thechopper.sh
