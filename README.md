# Determination-of-the-Composition-of-the-Universe-Using-Type-Ia-Supernovae

## Abstract
The objective of this investigation is to study the acceleration of the expansion of the universe by
determining the relative energy densities of dark energy and matter. Using type Ia supernovae as
standard candles, we analyse measurements of their redshift and apparent magnitude in the B-band.
We first fit a simple model for $m_B(z)$ in the low redshift limit to the $z \leq 0.1$ data and determine that
type Ia supernovae have an effective blue-band absolute magnitude of $\mathscr{M}_B = −3.19 \pm 0.07$. We then
construct a general relativistic model for $m_B(z;\Omega_{M,0},\Omega_{\Lambda,0})$ under the assumption of a flat universe.
We fit the data to this model both with and without the constraint that $\Omega_{M,0} + \Omega_{\Lambda,0} = 1$ and find that
the unconstrained fits have higher coefficients of determination and are therefore, likely, better quality
fits. When fitting this model to the data-set from Perlmutter et al. (1999), the normalized energy
densities of matter and dark energy are found to be $\Omega_{M,0} = 0.30$ and $\Omega_{\Lambda,0} = 0.91$. In contrast, when
using the updated data-set from Suzuki et al. (2012), which contains many more SNe over a larger
range of redshift, these parameters are found to be $\Omega_{M,0} = 0.73$ and $\Omega_{\Lambda,0} = 0.16$. This result supports
a mass-based, decelerating universe, contradicting the common idea of accelerating expansion driven
by dark energy.

## Project description
This project was conducted as a course requirement for Astronomy 4602 at Western University.

## Files:

1 - SNeDat.txt: 2011 data-set **MUST BE INCLUDED IN WORKING DIRECTORY BEFORE RUNNING ANY CODE**

2 - lowzArr_11.csv, lowzArr_99.csv, proDat_11.csv, proDat_99.csv: contain processed data, if not included in your working
    directory, run DataProcessing.m first.

3 - DataProcessing.m: processes all of the data. SNeDat.txt is required for the code to execute as it contains the 2011 data.
    The 1999 data was hard coded into the m-file so no external file is required. The code will output 4 .csv files with
    processed data which are needed for the rest of the m-files to execute (**MUST RUN DATAPROCESSING.M BEFORE ANYTHING 
    ELSE IF YOU HAVE NOT INCLUDED THE CSV FILES IN YOUR WORKING DIRECTORY**).

4 - MB_Solver.m: Solves for MB using low redshift data, also plots the fit against the data. Also contains statistical analysis.

5 - Numerical_Integration_Constrained.m, Numerical_Integration_Unconstrained.m: Solves for the Omega values and plots the fits.
    Much of the code is repeated in both files, however, if it was all in one file, there would be too many variables which
    complicates finding a variable in question. Also contains statistical analysis.

6 - PlottingVariousOmega.m: plots experimental data against best fits, fits with extreme Omega values, and Omega values from
    Perlmutter et. al (1999)

## Scientific Report:

The associated report can be found in the repository as Determination-of-the-Composition-of-the-Universe-Using-Type-Ia-Supernovae.pdf

## Notes:

All of the code was produced by Aidan Sirbu and Katie Brown
