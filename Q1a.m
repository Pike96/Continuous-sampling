clear all; close all; clc;

M1 = 1; % Mean of X
M2 = 2; % Mean of Y
V1 = 4; % Variance of X
V2 = 9; % Variance of Y

u1 = rand(1000,1);
u2 = rand(1000,1);

% Geberate X and Y that are N(0,1) random variables and independent
X = sqrt( - 2*log(u1)).*cos(2*pi*u2 ); 
Y = sqrt( - 2*log(u1)).*sin(2*pi*u2 );

% Scale them to a particular mean and variance 
x = sqrt(V1)*X + M1; % x~ N(M1,V1)
y = sqrt(V2)*Y + M2; % y~ N(M2,V2)

c = cov(x,y);
disp(['The covariance between X and Y is: ' num2str(c(2,1))]);

a = x+y;
disp(['The sample mean of A is: ' num2str(mean(a))]);
disp(['The sample variance of A is: ' num2str(var(a))]);

yyaxis left
hist(a,20)  % num of bins 20

title('Histogram of A = X + Y and theoretical pdf')
xlabel('Value')
ylabel('Number of samples')

yyaxis right
t = min(a):0.5:max(a);
pmf = normpdf(t,3,sqrt(13));  % the sum is N(3,13)
plot(t, pmf, 'r', 'linewidth', 2);
ylabel('Theoretical pmf')
set(gca, 'YColor', 'r')

disp(['The theoretical mean of A is: ' num2str(3)]);
disp(['The theoretical variance of A is: ' num2str(13)]);

