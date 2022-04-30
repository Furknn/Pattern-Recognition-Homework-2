% Furkan Sevgili 524121023
% Setup
randn("seed",0)
N=1000;

% Class 1
P1=.6;
m1=[1 1];
S1=[12 0;0 1];

% Class 2
P2=.3;
m2=[7 7];
S2=[8 3;3 2];

% Class 3
P3=.1;
m3=[15 1];
S3=[2 0;0 2];

P=[P1 P2 P3]; % Priors 
mu=[m1;m2;m3]; % Means
Sigma=cat(3,S1,S2,S3); % Covariances

% Create data points from GM distribution
gm=gmdistribution(mu,Sigma,P);
[A,Class]=random(gm,1000);
X=A(:,1);
Y=A(:,2);
dataset=[X Y Class];

% PDF function
gmPDF = @(x,y) arrayfun(@(x0,y0) pdf(gm,[x0 y0]),x,y);

% 3D Surface plot
figure;
tiledlayout(1,2);
nexttile
fsurf(gmPDF,[-11 21 -5 12]);
title("3D PDF of the GMM")
xlabel("X");
ylabel("Y");


% Scatter plot
nexttile
data1=dataset(dataset(:,3)==1, :);
data2=dataset(dataset(:,3)==2, :);
data3=dataset(dataset(:,3)==3, :);

scatter(data1(:,1) , data1(:,2),10,'.') 
hold on
scatter(data2(:,1) , data2(:,2),10,'*')
scatter(data3(:,1) , data3(:,2),10,'x') 

h = fcontour(gmPDF);
title("GMM - PDF Contours and Simulated Data")
xlabel("X");
ylabel("Y");
