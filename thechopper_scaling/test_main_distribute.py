import sys

import numpy as np
import numpy.random as nr

from mpi4py import MPI
import thechopper as tc

# divided over nx*ny*nz sub-volumes
def counting_prediction(n_p, r_L, r_max, nx, ny, nz):
    dx = r_L/nx + 2.0*r_max
    dy = r_L/ny + 2.0*r_max
    dz = r_L/nz + 2.0*r_max
    navg = dx*dy*dz*n_p**3/r_L**3
    nstdev = np.sqrt(navg)
    return navg, nstdev

def arr_avg(arr):
    return arr.sum()/arr.size

def arr_stdev(arr):
    aa = arr_avg(arr)
    return np.sqrt( ((arr - aa)**2).sum() / (arr.size - 1.0) )

# per rank on the comm
def print_timing_stats(comm, t1, t2, label=''):
    dt = t2-t1
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
def print_counting_stats(comm, nx, ny, nz, dl, rl):
    nxnynz = nx*ny*nz
    na_in = np.zeros(nxnynz)
    for i in range(len(rl)):
        r = rl[i]
        d = dl[i]
        x = d['x']
        na_in[r] = len(x)
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
# prints info for all ranks in nx*ny*nz
def print_ranges(comm, dl, rl):
    rank = comm.Get_rank()
    size = comm.Get_size()
    
    for i in range(size):
        comm.Barrier()
        if i == rank:
            for j in range(len(rl)):
                r = rl[j]
                d = dl[j]
                x = d['x']
                y = d['y']
                z = d['z']
                print('%d %d n = %d x = %s y = %s z = %s'%(rank,r,len(x),minmax2str(x),minmax2str(y),minmax2str(z)))
            sys.stdout.flush()
        comm.Barrier()
    return
    
def scaling_test(comm, n_p, r_L, r_max, prq=False):
    rank = comm.Get_rank()
    size = comm.Get_size()

    nx,ny,nz = MPI.Compute_dims(size,3)
    
    cat = {}

    t1 = MPI.Wtime()
    if rank==0:
        cat['x'] = r_L*nr.rand(n_p**3)
        cat['y'] = r_L*nr.rand(n_p**3)
        cat['z'] = r_L*nr.rand(n_p**3)
    t2 = MPI.Wtime()
    print_timing_stats(comm, t1, t2, 'init ')

    t1 = MPI.Wtime()
    _r = tc.get_buffered_subvolumes(comm, cat, nx, ny, nz, r_L, r_max)
    t2 = MPI.Wtime()
    print_timing_stats(comm, t1, t2, 'xfer ')
    
    dl, rl = _r

    print_counting_stats(comm, nx, ny, nz, dl, rl)
    comm.Barrier()
    
    if rank == 0:
        navg,nstdev = counting_prediction(n_p, r_L, r_max, nx, ny, nz)
        print('navg = %f nstdev = %f'%(navg,nstdev))
        sys.stdout.flush()
    comm.Barrier()

    if prq:
        print_ranges(comm, dl, rl)
        comm.Barrier()
    
    return

if __name__ == '__main__':
    argv = sys.argv

    if len(argv) < 4:
        print('USAGE: %s <n_p> <r_L> <r_max> [print_ranges=0]'%argv[0])
        print('')
        print('<n_p> = number of particles in 1D, total particles = n_p^3')
        print('<r_L> = box side length, total volume = r_L^3')
        print('<r_max> = max pairwise distance')
        print('[print_ranges=0] = whether to print x/y/z/ min/max per rank (optional)')
        sys.exit(-1)

    t1 = MPI.Wtime()
    
    n_p = int(argv[1])
    r_L = float(argv[2])
    r_max = float(argv[3])
    prq = 0
    if len(argv) > 4:
        prq = int(argv[4])

    comm = MPI.Comm(MPI.COMM_WORLD)
    
    scaling_test(comm, n_p, r_L, r_max, prq!=0)

    t2 = MPI.Wtime()
    print_timing_stats(comm, t1, t2, 'total')
