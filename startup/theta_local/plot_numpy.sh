#! /bin/bash

python3 ./plot.py numpy "import numpy" \
	numpy_01.csv "Theta/SSD (1 RPN)" \
	numpy_64.csv "Theta/SSD (64 RPN)"
