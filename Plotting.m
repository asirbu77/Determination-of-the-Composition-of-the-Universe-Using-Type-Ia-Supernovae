%Download pre-processed SNe data
data = readmatrix("proDat.txt");
zarr = data(:,1);
mB = data(:,2);
mBunc = data(:,3);

%Define parameters
MB = -18;
c = 3e8;
OmegaMarr = [1, 0.5, 0.3, 0];
OmegaAarr = [0, 0.5, 0.7, 1];
mB_model = zeros(714,4);

%For each combination of Omega values, solve for mB model with z data as 
%indepentent variable
for j = 1:4
    fun = @(z) 1./sqrt(OmegaMarr(j)*(1+z).^3+OmegaAarr(j));
    for i = 1:714
        mB_model(i,j) = MB+5*log10(c*(1+zarr(i))*integral(fun,0,zarr(i)));
    end
end

%Plot observational mB data along with each model
scatter(zarr,mB,10,"filled");
hold on
plot(zarr, mB_model(:,1), LineWidth=2);
plot(zarr, mB_model(:,2), LineWidth=2);
plot(zarr, mB_model(:,3), LineWidth=2);
plot(zarr, mB_model(:,4), LineWidth=2);
legend("Data", "\Omega_A=0, \Omega_{\Lambda}=1", ...
    "\Omega_A=0.5, \Omega_{\Lambda}=0.5", ...
    "\Omega_A=0.7, \Omega_{\Lambda}=0.3", ...
    "\Omega_A=1, \Omega_{\Lambda}=0")
xlabel("Redshift");
ylabel("Apparent Magnitude");
hold off
