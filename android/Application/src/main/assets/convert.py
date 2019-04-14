import numpy as np
import operator

wtoidx = np.load("./wordmap.npy").tolist()

wtoidx = sorted(wtoidx.items(), key=operator.itemgetter(1))

wtoidx = [i[0] for i in wtoidx]

with open('idmap', 'w') as f:
    for item in wtoidx:
        f.write("%s\n" % item)