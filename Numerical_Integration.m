data = readmatrix('proDat.csv');
z = data(:,1);
mB = data(:,2);
mBunc = data(:,3);
MB = -18.025;
c = 3.0e8;

global ymax;
ymax = 10^((mB(714)+MB)/5)/(c*(1+z(714)));
zmax = z(714);

x0 = [0.3, 0.7];
options = optimset('MaxFunEvals',100000);
x = fminsearch(@model,x0,options);


function y = model(x)
global ymax;
zmax = 1.414;
z = 0.001:0.001:zmax;
coeff = zmax/(2*length(z));
series = [];
series(1) = 1/sqrt(x(1)*(1+z(1))^3+x(2));
for i=2:length(z)-1
    series(i)=2/sqrt(x(1)*(1+z(i))^3+x(2));
end
series(length(z)) = 1/sqrt(x(1)*(1+z(length(z)))^3+x(2));
y = coeff*sum(series)-ymax;
end