clear all; close all; clc;

alpha = 0.5;
beta = 0;
gam = 1;
delta = 0;
X = stblrnd(alpha,beta,1,0,1e8,1);
lim = 5;
Y = X(X<lim&X>-lim); % Only take numbers within limit

figure(1)
yyaxis left
hist(Y,100000)

title(['X histogram & Symmetric \alpha-stable densities, \alpha = ',...
    num2str(alpha), ', \beta = ',...
    num2str(beta), ', \gamma = 1, \delta = 0'])
xlabel('Value')
ylabel('Number of samples')

yyaxis right
t = -lim:.01:lim;
pmf = stblpdf(t,alpha,beta,gam,delta,'quick');
plot(t, pmf, 'r');
ylabel('Theoretical pmf')
set(gca, 'YColor', 'r')

figure(2)
plot(X)
title(['Time series plot with \alpha = ',...
    num2str(alpha), ', \beta = ',...
    num2str(beta), ', \gamma = 1, \delta = 0'])
xlabel('Sample #')
ylabel('Sample Value')
