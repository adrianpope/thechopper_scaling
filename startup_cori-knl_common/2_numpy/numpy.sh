#! /bin/bash

source modules.cori-knl.env.sh
source miniconda3.sh
conda activate alltoall
python3 -c "import numpy"
