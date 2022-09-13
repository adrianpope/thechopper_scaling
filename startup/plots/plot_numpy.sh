#! /bin/bash

python3 ./plot.py numpy "import numpy" \
	../theta_grand/numpy_01.csv "Theta/grand (1 RPN)" \
	../theta_grand/numpy_64.csv "Theta/grand (64 RPN)" \
	../cori-knl_common/numpy_01.csv "Cori-KNL/common (1 RPN)" \
	../cori-knl_common/numpy_68.csv "Cori-KNL/common (68 RPN)" \
	../theta_local/numpy_01.csv "Theta/SSD (1 RPN)" \
	../theta_local/numpy_64.csv "Theta/SSD (64 RPN)"
