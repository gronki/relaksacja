import matplotlib.pyplot as plt
import numpy as np
from sys import argv

def loadxy(fn):
    return np.loadtxt(fn, dtype={
                'names': ('i','x','y'),
                'formats':('i4','f4','f4'),
            }
        )

plt.ylim(0,1)
plt.xlim(0,1)

for fn in argv[2:]:
    d = loadxy(fn)
    plt.plot(d['x'],d['y'],label=fn)

plt.legend()
plt.show()
# plt.savefig(argv[1], dpi=200)
