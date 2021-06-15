% Articel title: Modelling the Spread of COVID-19 Using the Fundamental Principles of Fluid Dynamics 
% Thanks: Texas A&M University at Qatar
% Read COVID 19 data and organize it

[num,txt,raw] = xlsread('covid0613.csv') ;
listcovid=zeros(2000,240);
listcountry = cell(1,240); 
c1={'Afghanistan'};
cnum=1;
stii=2;
for ii=2:length(txt)
    ci=txt(ii,3);
   if  strcmp(c1{1},ci{1})
    c2=txt(ii,3);
   else
    listcountry{1,cnum}=c1{1};
    c1=txt(ii,3);  
    endii=ii;
    covidcum=num(stii:endii,1);
    stii=endii+1;
    listcovid(1:length(covidcum),cnum)=covidcum;
    popc(1,cnum)=num(ii-20,1)/num(ii-20,7)*1e6;
    maxinf(cnum,1)=max(covidcum)/popc(1,cnum);
    cnum=cnum+1;
   end
    
    
end

% xlswrite('covid0606.xlsx',listcovid,'covidsep')
%  xlswrite('covid0606.xlsx',listcountry,'covidsep')
