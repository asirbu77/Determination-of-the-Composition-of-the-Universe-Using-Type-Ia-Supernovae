
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
omega0 = [0.5, 0.5]; % Initial guess
[solTR,resnormTR,residualTR,exitflagTR,outputTR] = lsqcurvefit(...
    @(param, z) fun(param(1), param(2), z), omega0,...
    z, mB); % Solve system
omegaM_TR = solTR(1);
omegaL_TR = solTR(2);
sumOmega = omegaM_TR + omegaL_TR;

% ==============================
% Solve for omegaM and omegaL
% 
% Algo: Levenberg-Marquardt
% ==============================
options = optimoptions('lsqcurvefit','Algorithm','levenberg-marquardt');
lb = [];
ub = [];
[solLM,resnormLM,residualLM,exitflagLM,outputLM] = lsqcurvefit(...
    @(param, z) fun(param(1), param(2), z), omega0, z, mB,...
    lb, ub, options); % Solve system
omegaM_LM = solLM(1);
omegaL_LM = solLM(2);

% =================================
% Statistical Analysis
%
% Performed only on TR algo values
% since both algo's yield same
% parameters.
% =================================
mu_mB = mean(mB); % Mean mB
RSS = sum((mB - fun(omegaM_TR, omegaL_TR, z)).^2);% Residual Sum of Squares
TSS = sum((mB - mean(mB)).^2); % Total sum of squares
R2 = 1-RSS/TSS; % R sqaured
var_mB = (mB - mu_mB).^2; % Individual variance
chi2 = sum((mB - fun(omegaM_TR, omegaL_TR, z)).^2./var_mB); % Chi squared
redchi2 = chi2/712; % Reduced chi squared

% ===============
% Model function
% ===============
function [mB] = fun(omegaM, omegaL, z)
    global MB c;
    mB = zeros(714, 1);
    sub_fun = @(z) 1./sqrt(omegaM*(1+z).^3+omegaL);
    for i = 1:714
        mB(i) = MB+5*log10(c*(1+z(i))*integral(sub_fun,0,z(i)));
    end
end
