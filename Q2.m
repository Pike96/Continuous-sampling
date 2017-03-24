clear all; close all; clc;

i = 0;
rej = 0;
th = 5.5;   % theta = 5.5
c = (exp(-th)*th^(th-1)/gamma(th))/(exp(-th/th)/th); % f(5.5)/g(5.5)
while(i<=99999)
    u1 = rand; u2 = rand;
    Y = -th*log(u1);       % Inverse Exp(theta)
    if u2 <= (exp(-Y)*Y^(th-1)/gamma(th))/((exp(-Y/th)/th)*c) % u<=f/g*c
        i = i + 1;
        X(i) = Y;
    else rej = rej + 1;
    end
end

yyaxis left
hist(X,80)  % num of bins 20

title('Histogram of X and theoretical pdf')
xlabel('Value')
ylabel('Number of samples')

yyaxis right
t = min(X):0.5:max(X);
pmf = gampdf(t,5.5,1);  % the sum is N(3,13)
plot(t, pmf, 'r', 'linewidth', 2);
ylabel('Theoretical pmf')
set(gca, 'YColor', 'r')

disp(['The acceptance rate is: ' num2str(i/(i+rej))]);
