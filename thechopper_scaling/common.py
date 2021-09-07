import sys
import numpy as np
from mpi4py import MPI

# utils
def arr_avg(arr):
    return arr.sum()/arr.size

def arr_stdev(arr):
    aa = arr_avg(arr)
    return np.sqrt( ((arr - aa)**2).sum() / (arr.size - 1.0) )

# per rank on the comm
def print_timing_stats(comm, dt, label=''):
    rank = comm.Get_rank()
    size = comm.Get_size()
    dta_in = np.zeros(size)
    dta_in[rank] = dt
    dta = np.zeros(size)
    comm.Allreduce(dta_in, dta, MPI.SUM)
    if rank == 0:
        dtmin = dta.min()
        dtmax = dta.max()
        dtavg = arr_avg(dta)
        dtstdev = arr_stdev(dta)
        print('%s (seconds) max %f avg %f min %f stdev %f'%(label,dtmax,dtavg,dtmin,dtstdev))
        sys.stdout.flush()
    comm.Barrier()
    return

# per rank in nx*ny*nz
def print_counting_stats(comm, nx, ny, nz, data_list, cell_list):
    nxnynz = nx*ny*nz
    na_in = np.zeros(nxnynz)
    for i in range(len(cell_list)):
        c = cell_list[i]
        d = data_list[i]
        x = d['x']
        na_in[c] = len(x)
    na = np.zeros(nxnynz)
    comm.Allreduce(na_in, na, MPI.SUM)

    rank = comm.Get_rank()
    if rank == 0:
        nmin = na.min()
        nmax = na.max()
        navg = arr_avg(na)
        nstdev = arr_stdev(na)
        print('navg = %f nstdev = %f nmin = %f nmax = %f'%(navg,nstdev,nmin,nmax))
        sys.stdout.flush()
    comm.Barrier()
    return

def minmax2str(arr):
    return '[%.3f,%.3f]'%(arr.min(),arr.max())

# loops over ranks on comm
# prints x,y,z min/max info for all ranks in nx*ny*nz
def print_ranges(comm, data_list, cell_list):
    rank = comm.Get_rank()
    size = comm.Get_size()
    
    for i in range(size):
        comm.Barrier()
        if i == rank:
            for j in range(len(cell_list)):
                c = cell_list[j]
                d = data_list[j]
                x = d['x']
                y = d['y']
                z = d['z']
                print('%d %d n = %d x = %s y = %s z = %s'%(rank,c,len(x),minmax2str(x),minmax2str(y),minmax2str(z)))
            sys.stdout.flush()
        comm.Barrier()
    return
