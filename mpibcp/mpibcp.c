#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#include <mpi.h>

#ifndef USE_POSIX
#define USE_POSIX 0
#else
#define USE_POSIX 1
#endif

#if USE_POSIX
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#endif

long get_file_size(char *filename) {
  long s = 0;
#if USE_POSIX
  struct stat fs;
  if( stat(filename, &fs) == 0 )
    s = fs.st_size;
#else
  FILE *fh = fopen(filename, "rb");
  if ( fh != NULL ) {
    fseek(fh, 0L, SEEK_END);
    s = ftell(fh);
    fclose(fh);
  }
#endif
  return s;
}

long read_file(char *filename, long nbytes, char *buffer) {
  long offset = 0;
#if USE_POSIX
  int fd = -1;
  int flags = O_RDONLY;
  fd = open(filename, flags);
  if ( fd != -1 ) {
    while(nbytes > 0) {
      long count = pread(fd, (void *)buffer, nbytes, offset);
      nbytes -= count;
      buffer = buffer + count;
      offset += count;
    }
    close(fd); fd = -1;  
  }
#else
  FILE *fh = fopen(filename, "rb");
  if ( fh != NULL ) {
    fread( (void *)buffer, nbytes, 1, fh);
    offset = nbytes;
    fclose(fh); fh = NULL;
  }
#endif
  return offset;
}

long write_file(char *filename, long nbytes, char *buffer) {
  long offset = 0;
#if USE_POSIX
  int fd = -1;
  int flags = O_WRONLY|O_CREAT;
  int mode = S_IRWXU;
  fd = open(filename, flags, mode);
  if ( fd != -1 ) {
    while(nbytes > 0) {
      long count = pwrite(fd, (void *)buffer, nbytes, offset);
      nbytes -= count;
      buffer = buffer + count;
      offset += count;
    }
    close(fd); fd = -1;
  }
#else
  FILE *fh = fopen(filename, "wb");
  if ( fh != NULL ) {
    fwrite(buffer, nbytes, 1, fh);
    offset = nbytes;
    fclose(fh); fh = NULL;
  }
#endif
  return offset;
}

int main(int argc, char *argv[]) {
  if(argc < 3) {
    fprintf(stderr,"USAGE: %s <global-src> <local-dest>\n",argv[0]);
    exit(-1);
  }

  MPI_Init(&argc, &argv);
  
  char *src = argv[1];
  char *dest = argv[2];

  int rank;
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);

  double t0, t1;
  
  char *buffer;
  long s, sr, sw;
  double MiB = 1024.0*1024.0;

  if(rank == 0) {

    s = get_file_size(src);
    buffer = (char *)malloc(s);
    
    t0 = MPI_Wtime();
    sr = read_file(src, s, buffer);
    t1 = MPI_Wtime();
    
    fprintf(stdout, "read  %ld of %ld bytes in %f seconds: %e MiB/s\n",
	    sr, s, t1-t0, (1.0*sr)/MiB/(t1-t0) );
    fflush(stdout);
  }

  MPI_Bcast( (void *)&s, 1, MPI_LONG, 0, MPI_COMM_WORLD);
  if (rank != 0)
    buffer = (char *)malloc(s);

  long intmax = INT_MAX;
  long nb = s/intmax + 1;

  MPI_Barrier(MPI_COMM_WORLD);
  t0 = MPI_Wtime();
  
  for (long i = 0; i < nb; i++) {
    int count = (int)intmax;
    if(i == nb-1)
      count = (int)(s%intmax);
    MPI_Bcast( (void *)&buffer[i*intmax], count, MPI_BYTE, 0, MPI_COMM_WORLD);
  }

  MPI_Barrier(MPI_COMM_WORLD);
  t1 = MPI_Wtime();
  
  if(rank == 0) {
    fprintf(stdout, "bcast %ld of %ld bytes in %f seconds: %e MiB/s\n", 
	    s, s, t1-t0, (1.0*s)/MiB/(t1-t0) );
    fflush(stdout);
  }

  MPI_Barrier(MPI_COMM_WORLD);
  t0 = MPI_Wtime();
  
  sw = write_file(dest, s, buffer);

  MPI_Barrier(MPI_COMM_WORLD);
  t1 = MPI_Wtime();

  if(rank == 0) {
    fprintf(stdout, "wrote %ld of %ld bytes in %f seconds: %e MiB/s\n", 
	    sw, s, t1-t0, (1.0*sw)/MiB/(t1-t0) );
    fflush(stdout);
  }
    
  MPI_Barrier(MPI_COMM_WORLD);
  MPI_Finalize();

  free(buffer);
  
  return 0;
}
