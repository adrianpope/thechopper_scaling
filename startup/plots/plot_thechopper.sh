#! /bin/bash

python3 ./plot.py thechopper "thechopper" \
	../theta_grand/thechopper_01.csv "Theta/grand (1 RPN)" \
	../theta_grand/thechopper_64.csv "Theta/grand (64 RPN)" \
	../cori-knl_common/thechopper_01.csv "Cori-KNL/common (1 RPN)" \
	../cori-knl_common/thechopper_68.csv "Cori-KNL/common (68 RPN)"
