% Articel title: Modelling the Spread of COVID-19 Using the Fundamental Principles of Fluid Dynamics 
% Thanks: Texas A&M University at Qatar
% Optimization function used for fitting the model to data
function [error] = optimization(C,popu)
global popu
global f
% d = readtable('Data.xlsx','basic',true);
s = popu;
I = f(1); 
%t = length(f(2:end)) - sum(isnan(f(2:end)));
t = length(f(2:end));
phi = zeros(t,1);
phi(1) = I/s;
cases = zeros(t,1);
cases(1) = phi(1)*s;
for i = 2:t
    phi(i)=  phi(i-1) + (C(2).*(phi(i-1))) + C(3).*exp(-phi(i-1)) - ((phi(i-1)).^(C(1)));
    cases(i) = phi(i)*s;
end
a = f(2:t+1); 
errors = (cases-a).^2;
error = sum(errors)/length(errors);
C(4)=error;

