import numpy as np
import matplotlib.pylab as plt
import matplotlib as mpl
from cycler import cycler
mpl.rcParams['axes.prop_cycle'] = cycler(color='cmykbgr')

mydata=[]
mylabels=[]
mydata.append(np.loadtxt('sleep1_01.csv',delimiter=','))
mylabels.append('aprun sleep 1 (1 RPN)')
mydata.append(np.loadtxt('sleep1_64.csv',delimiter=','))
mylabels.append('aprun sleep 1 (64 RPN)')
mydata.append(np.loadtxt('numpy_01.csv',delimiter=','))
mylabels.append('import numpy (1 RPN)')
mydata.append(np.loadtxt('numpy_64.csv',delimiter=','))
mylabels.append('import numpy (64 RPN)')

for d in mydata:
    d[:,2] *= 1.0/60

myplot=plt.plot
mystyle=':+'
#myxscale='linear'
#myyscale='linear'
myxscale='log'
myyscale='log'

for i in range(len(mydata)):
    d = mydata[i]
    l = mylabels[i]
    myplot(d[:,0],d[:,2],mystyle,label=l)
plt.legend()
plt.xlabel('nodes')
plt.ylabel('minutes')
plt.xscale(myxscale)
plt.yscale(myyscale)
plt.savefig('nodes.pdf')
plt.savefig('nodes.png')

plt.close()

for i in range(len(mydata)):
    d = mydata[i]
    l = mylabels[i]
    myplot(d[:,0]*d[:,1],d[:,2],mystyle,label=l)
plt.legend()
plt.xlabel('ranks')
plt.ylabel('minutes')
plt.xscale(myxscale)
plt.yscale(myyscale)
plt.savefig('ranks.pdf')
plt.savefig('ranks.png')
