# for thechopper/alltoall branch

import sys

import numpy as np
import numpy.random as nr

from mpi4py import MPI
import thechopper as tc
import thechopper.data_chopper as dc

from common import *
    
def scaling_test(comm, n_p, r_L, r_max, prq=False):
    rank = comm.Get_rank()
    nranks = comm.Get_size()

    nx,ny,nz = MPI.Compute_dims(nranks,3)
    cells_per_rank_list = dc._get_cells_assigned_to_ranks(nx,ny,nz,nranks)
    mycell = cells_per_rank_list[rank][0]
    
    cat_in = {}

    numpercell = n_p**3 // nranks
    
    t1 = MPI.Wtime()
    cat_in['x'] = r_L*nr.rand(numpercell)
    cat_in['y'] = r_L*nr.rand(numpercell)
    cat_in['z'] = r_L*nr.rand(numpercell)
    t2 = MPI.Wtime()
    print_timing_stats(comm, t2-t1, 'init ')

    cell_list = [mycell]
    data_list = [cat_in]
    
    if prq:
        print_ranges(comm, data_list, cell_list)
        comm.Barrier()

    t1 = MPI.Wtime()
    cat_out = tc.get_data_for_rank(comm, cat_in, nx, ny, nz, r_L, r_max)
    t2 = MPI.Wtime()
    print_timing_stats(comm, t2-t1, 'xfer ')

    cell_list = list(cat_out.keys())
    data_list = []
    for c in cell_list:
        data_list.append(cat_out[c])
    
    print_counting_stats(comm, nx, ny, nz, data_list, cell_list)
    comm.Barrier()
    
    if prq:
        print_ranges(comm, data_list, cell_list)
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
    print_timing_stats(comm, t2-t1, 'total')
