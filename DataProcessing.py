import numpy as np

rawDat = np.loadtxt("SNeDat.txt", dtype=str, delimiter=' & ', max_rows=749, usecols=(1, 2))  # Load Data
# proDat = np.zeros((rawDat.shape[0], 3))
# proDat[:, 0] = rawDat[:, 0].astype(float)

# Delete NaN entries
deleteList = []
for i in range(rawDat.shape[0]):
    if 'n' in rawDat[i, 1]:
        deleteList.append(i)
rawDat = np.delete(rawDat, deleteList, axis=0)
# Processed data without NaN's
proDat = np.zeros((rawDat.shape[0], 3))
proDat[:, 0] = rawDat[:, 0].astype(float)  # Add redshift data to processed data

# Process mb data
for i in range(rawDat.shape[0]):
    line = rawDat[i, 1].split("(")
    magB_unc = float(line[1].rstrip(")"))
    magB = float(line[0])
    proDat[i, 1] = magB  # 2nd column houses mB
    proDat[i, 2] = magB_unc  # 3rd column houses uncertainty in mB

# Create array of low redshift data (z <= 0.1)
lowzList = []
for i in range(proDat.shape[0]):
    if proDat[i, 0] <= 0.1:
        lowzList.append(i)
LowzArr = np.zeros((len(lowzList), 3))  # Array of low redshift data (3 columns)
for i in range(len(lowzList)):
    LowzArr[i, :] = proDat[lowzList[i], :]  # Add low redshift data
LowzArr = LowzArr[LowzArr[:, 0].argsort()]  # Sort data by increasing redshift

# Export processed data array to csv
proDat = proDat[proDat[:,0].argsort()]  # Sort data by increasing redshift
np.savetxt("proDat.csv", proDat)  # Export data
