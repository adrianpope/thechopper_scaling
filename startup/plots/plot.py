import sys
import numpy as np
import matplotlib.pylab as plt
import matplotlib as mpl
from cycler import cycler
import itertools

dpi=150

color_list_string = 'cmykbrg'
linestyle_list = ['-','--','-.',':']

myplot=plt.plot
#myxscale='linear'
#myyscale='linear'
myxscale='log'
myyscale='log'

mydata=[]
mylabels=[]

argv = sys.argv
if len(argv) < 5:
    print('USAGE: python3 %s <outBase> <title> <file1> <label1> [file2] [label2] ...'%argv[0])
    sys.exit(-1)

outBase = argv[1]
title = argv[2]

for i in range(3,len(argv),2):
    fileName = argv[i]
    label = argv[i+1]
    d = np.loadtxt(fileName,delimiter=',')
    if d.shape[1] == 4:
        d[:,2] += d[:,3]
    mydata.append(d)
    mylabels.append(label)

for d in mydata:
    d[:,2] *= 1.0/60

mpl.rcParams['axes.prop_cycle'] = cycler(color=color_list_string)
cl = itertools.cycle(linestyle_list)
for i in range(len(mydata)):
    d = mydata[i]
    l = mylabels[i]
    myplot(d[:,0],d[:,2],next(cl),label=l)
plt.legend()
plt.xlabel('nodes')
plt.ylabel('minutes')
plt.xscale(myxscale)
plt.yscale(myyscale)
plt.title(title)
plt.savefig('%s_nodes.pdf'%outBase)
plt.savefig('%s_nodes.png'%outBase,dpi=dpi)

plt.close()

mpl.rcParams['axes.prop_cycle'] = cycler(color=color_list_string)
cl = itertools.cycle(linestyle_list)
for i in range(len(mydata)):
    d = mydata[i]
    l = mylabels[i]
    myplot(d[:,0]*d[:,1],d[:,2],next(cl),label=l)
plt.legend()
plt.xlabel('ranks')
plt.ylabel('minutes')
plt.xscale(myxscale)
plt.yscale(myyscale)
plt.title(title)
plt.savefig('%s_ranks.pdf'%outBase)
plt.savefig('%s_ranks.png'%outBase,dpi=dpi)
