% Articel title: Modelling the Spread of COVID-19 Using the Fundamental Principles of Fluid Dynamics 
% Thanks: Texas A&M University at Qatar

function createfigure2(ii,X1, Y1, Y2)
%CREATEFIGURE2(X1, Y1, Y2)
%  X1:  vector of x data
%  Y1:  vector of y data
%  Y2:  vector of y data

%  Auto-generated by MATLAB on 11-Jun-2020 16:34:14

% Create figure
figure1 = figure;
set(figure1,'color','w');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'LineWidth',3,'Color',[1 0 0]);

% Create plot
plot(Y2,'LineWidth',5,'LineStyle',':','Color',[0 0 0]);

% Create xlabel
xlabel('Time (Days)');

% Create ylabel
ylabel('Cumulative Infected Cases');
 title(num2str(ii));
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',14);
