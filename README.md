# Determination-of-the-Composition-of-the-Universe-Using-Type-Ia-Supernovae

## Abstract

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
