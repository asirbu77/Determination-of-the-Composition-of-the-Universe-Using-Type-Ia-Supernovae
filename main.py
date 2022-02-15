import numpy as np
from astropy import constants as const
from scipy.optimize import curve_fit
from DataProcessing import lowzArr, proDat

def mb(z, Mb):
    return 5*np.log10(const.c.value * z) + Mb

fit = curve_fit(mb, lowzArr[:, 0], lowzArr[:, 1])
print(min(lowzArr[:, 0]))


