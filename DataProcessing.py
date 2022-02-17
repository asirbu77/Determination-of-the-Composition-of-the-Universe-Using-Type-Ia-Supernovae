import numpy as np

rawDat = np.loadtxt("SNeDat.txt", dtype=str, delimiter=' & ', max_rows=749, usecols=(1, 2))
#proDat = np.zeros((rawDat.shape[0], 3))
#proDat[:, 0] = rawDat[:, 0].astype(float)

deleteList = []
for i in range(rawDat.shape[0]):
    if 'n' in rawDat[i, 1]:
        deleteList.append(i)
rawDat = np.delete(rawDat, deleteList, axis=0)
proDat = np.zeros((rawDat.shape[0], 3))
proDat[:, 0] = rawDat[:, 0].astype(float)

for i in range(rawDat.shape[0]):
    line = rawDat[i, 1].split("(")
    magB_unc = float(line[1].rstrip(")"))
    magB = float(line[0])
    proDat[i, 1] = magB
    proDat[i, 2] = magB_unc

lowzList = []
for i in range(proDat.shape[0]):
    if proDat[i, 0] <= 0.1:
        lowzList.append(i)
LowzArr = np.zeros((len(lowzList), 3))
for i in range(len(lowzList)):
    LowzArr[i, :] = proDat[lowzList[i], :]
LowzArr = LowzArr[LowzArr[:, 0].argsort()]
