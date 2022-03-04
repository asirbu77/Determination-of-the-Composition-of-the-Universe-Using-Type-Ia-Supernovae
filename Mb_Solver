%Import pre-processed low-redshift data
data = readmatrix("lowzArr.txt");
zarr = data(:,1);
mbarr = data(:,2);
mbunc = data(:,3);

Mb_0 = -18;     %Define initial guess for Mb

%Define the logarithmic model to fit
fitfun = fittype('Mb+5*log10(3e8*z)', 'dependent', {'mb'}, ...
    'independent', {'z'}, 'coefficients', {'Mb'});

%Fit model to data
solution = fit(zarr, mbarr, fitfun, 'StartPoint', Mb_0);
