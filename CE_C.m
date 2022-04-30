% Furkan Sevgili 524121023
clear
clc
randn("seed",0)
% Run exercise A
CE_A;
close;
%% Solution C1
% fit GM with 3 components
GMDistC1=fitgmdist(A,3);

% Report
disp("Report 1, GMM with 3 Compents");
display(GMDistC1);

%% Solution C2
MaxK=10;% Maximum number of components
AICValues=zeros(1,MaxK);
GMdists=cell(1,MaxK);

% Iterate over possible number of Components
for k=1:MaxK
    % Fit models
    GMdists{k}=fitgmdist(A,k);

    % Calculate AIC
    AICValues(k)=GMdists{k}.AIC;
end

% Get the model with minimum AIC value
[minAIC,index] = min(AICValues);
GMDistC2=GMdists{index};

%Report
disp("Report 2, GMM with components selected using AIC")
disp("Number of Components");
disp(index);
display(GMDistC2);

%% Solution C3
%% Plot Solution C1
% PDF for GMdistC1
gmc1PDF = @(x,y) arrayfun(@(x0,y0) pdf(GMDistC1,[x0 y0]),x,y);
tiledlayout(1,2);

% 3D Surface plot
nexttile
fsurf(gmc1PDF,[-11 21 -5 12]);
title("GMM with 3 Compents - 3D PDF")
xlabel("X");
ylabel("Y");

% Scatter plot
nexttile
scatter(data1(:,1) , data1(:,2),10,'.') 
hold on
scatter(data2(:,1) , data2(:,2),10,'*')
scatter(data3(:,1) , data3(:,2),10,'x') 
h1 = fcontour(gmc1PDF);
title("GMM with 3 Compents - PDF Contours and Simulated Data")
xlabel("X");
ylabel("Y");


%% Plot Solution C2
% PDF for GMdistC2
figure
gmc2PDF = @(x,y) arrayfun(@(x0,y0) pdf(GMDistC2,[x0 y0]),x,y);
tiledlayout(1,2);

% 3D Surface plot
nexttile
fsurf(gmc2PDF,[-11 21 -5 12]);
title("GMM with components selected using AIC - 3D PDF")
xlabel("X");
ylabel("Y");

% Scatter plot
nexttile
scatter(data1(:,1) , data1(:,2),10,'.') 
hold on
scatter(data2(:,1) , data2(:,2),10,'*')
scatter(data3(:,1) , data3(:,2),10,'x') 
h2 = fcontour(gmc2PDF);
title("GMM with components selected using AIC - PDF Contours and Simulated Data")
xlabel("X");
ylabel("Y");


