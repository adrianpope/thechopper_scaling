import time

start = time.time()
from mpi4py import MPI
end = time.time()

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
nranks = comm.Get_size()

dt_in = end-start
dt_max = comm.allreduce(dt_in, MPI.MAX)
dt_min = comm.allreduce(dt_in, MPI.MIN)
dt_sum = comm.allreduce(dt_in, MPI.SUM)
dt_avg = dt_sum / nranks

import sys
nnodes = 0
if len(sys.argv) > 1:
    nnodes = int(sys.argv[1])

if rank==0:
    print('#%s\t%s\t%-10s\t%-10s\t%-10s'%('nodes','ranks','max','avg','min'))
    print('%d\t%d\t%-10f\t%-10f\t%-10f'%(nnodes,nranks,dt_max,dt_avg,dt_min))
