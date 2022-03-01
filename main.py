import numpy as np
from astropy import constants as const
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
#from SNe_Dat_1999 import LowzArr
from DataProcessing import LowzArr, proDat

def mb(z, Mb):
    return 5*np.log10(const.c.value * z) + Mb

fit = curve_fit(mb, LowzArr[:,0], LowzArr[:,1])
Mb = fit[0][0]
print("Estimated Mb:", Mb)

plt.plot(LowzArr[:,0], 5*np.log10(const.c.value*LowzArr[:,0])+Mb)
plt.scatter(LowzArr[:,0], LowzArr[:,1], s=20, color="red")
plt.xlabel("Redshift")
plt.ylabel("Apparent Magnitude")
plt.show()
