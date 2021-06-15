% Articel title: Modelling the Spread of COVID-19 Using the Fundamental Principles of Fluid Dynamics 
% Thanks: Texas A&M University at Qatar

% Start with the guess values of the fiting parameters  


global popu
global f
numofcd=0;
phimax=[];
for ii=100:110
    if sum(ii==correct)>0
        continue
    end
    ra1=rangec(1,ii);
    ra2=rangec(2,ii);
    if ra2==0
        continue
        ra2
    end
    
    if ra1==0
        disp('Ra1')
        continue
        ra1
    end
    
    if isnan(ra1) || isnan(ra2)
        continue
    end
    
    curvevar=listcovid(ra1:ra2,ii);
    guess = [01.85, 0.6, 1.0e-4,0]; 
    options = optimset('MaxFunEvals',4000000);
    % fitting the model to the data 
    f=curvevar;
    popu=popc(1,ii);
    C = fminsearch(@optimization,guess,options);
    %d = readtable('Data.xlsx','basic',true);
    %f = d.Equatorial_Guinea;
    s = popc(1,ii);
    I = f(1);
    t = 400;
    phi = zeros(t,1);
    phi(1) = I/s;
    cases = zeros(t,1);
    cases(1) = phi(1)*s;
    for i = 2:t
        phi(i)=  phi(i-1) + (C(2).*(phi(i-1))) + C(3).*exp(-phi(i-1)) - ((phi(i-1)).^(C(1)));
        cases(i) = phi(i)*s;
    end
    numofcd=numofcd+1;
    Cpar(numofcd,:)=C;
    phimax(numofcd,1)=real(max(curvevar)/s);
%     C(4)
     createfigure2(ii,1:t,cases,f(2:(length(f(2:end)) - sum(isnan(f(2:end))))))
    
end
