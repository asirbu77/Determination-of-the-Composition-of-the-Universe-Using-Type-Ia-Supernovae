
% Data declaration
data = readmatrix('proDat.csv');
global MB c;
z = data(:,1);
mB = data(:,2);
mBunc = data(:,3);
MB = -18.025;
c = physconst('LightSpeed');

% ==============================
% Solve for omegaM and omegaL
% 
% Algo: Trust-region-reflective
% ==============================
omega0 = 0.5; % Initial guess
[solTR,resnormTR,residualTR,exitflagTR,outputTR] = lsqcurvefit(...
    @(param, z) fun(param, z), omega0,...
    z, mB); % Solve system
omegaL_TR = solTR;
omegaM_TR = 1 - omegaL_TR;

% ==============================
% Solve for omegaM and omegaL
% 
% Algo: Levenberg-Marquardt
% ==============================
options = optimoptions('lsqcurvefit','Algorithm','levenberg-marquardt');
lb = [];
ub = [];
[solLM,resnormLM,residualLM,exitflagLM,outputLM] = lsqcurvefit(...
    @(param, z) fun(param, z), omega0, z, mB,...
    lb, ub, options); % Solve system
omegaL_LM = solLM;
omegaM_LM = 1-omegaL_LM;

% =================================
% Statistical Analysis
%
% Performed only on TR algo values
% since both algo's yield same
% parameters.
% =================================
mu_mB = mean(mB); % Mean mB
RSS = sum((mB - fun(omegaL_TR, z)).^2);% Residual Sum of Squares
TSS = sum((mB - mean(mB)).^2); % Total sum of squares
R2 = 1-RSS/TSS; % R sqaured
var_mB = (mB - mu_mB).^2; % Individual variance
chi2 = sum((mB - fun(omegaL_TR, z)).^2./var_mB); % Chi squared
redchi2 = chi2/713; % Reduced chi squared

scatter(z, mB);
hold on
plot(z, fun(omegaL_TR, z));
hold off

% ===============
% Model function
% ===============
function [mB] = fun(omegaL, z)
    global MB c;
    mB = zeros(714, 1);
    sub_fun = @(z) 1./sqrt((1-omegaL)*(1+z).^3+omegaL);
    for i = 1:714
        mB(i) = MB+5*log10(c*(1+z(i))*integral(sub_fun,0,z(i)));
    end
end
