clear
clc

mean(1).mu = [-8,-7];
mean(2).mu = [1,0];
mean(3).mu = [-5,-2];
mean(4).mu = [10,-4];
mean(5).mu = [8,-5];

n(1) = 500;
n(2) = 700;
n(3) = 100;
n(4) = 500;
n(5) = 600;

cov(1).matrix = [4, 2; 2, 3];
cov(2).matrix = [2, -2; -2, 6];
cov(3).matrix = [1, -0.5; -0.5, 1];
cov(4).matrix = [1, -0.5; -0.5, 1];
cov(5).matrix = [1, -0.5; -0.5, 1];

for i=1:5
    D(i).set = mvnrnd(mean(i).mu,cov(i).matrix,n(i)); 
end

stepS = 2;
% generate more comples sets
t=-2:stepS:2;
tLength = length(t);
thicknes = 10;

DS1=[];
for i=1:tLength
    tSlice = rand(thicknes,2)*1.2;
    x(1:thicknes,1)=tSlice(:,1)+t(i);
    y(1:thicknes,1)=-tSlice(:,2)+t(i)^2;
    DS1 = [DS1;x,y];
end

D(6).set = DS1;


fh(1) = figure(1);
clf(fh(1))
for i=1:6
    scatter(D(i).set(:,1),D(i).set(:,2))
    hold on
end
