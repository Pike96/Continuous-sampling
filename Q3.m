figure(1)
x = -5:.01:5;
beta = 0;
gam = 1;
delta = 0;
plot( x , stblpdf(x,.5,beta,gam,delta,'quick'),...
  x , stblpdf(x,1,beta,gam,delta,'quick'),...
  x , stblpdf(x,1.8,beta,gam,delta,'quick'),...
  x , stblpdf(x,2,beta,gam,delta,'quick') )
axis([-5 5 0 .7]);
title('Symmetric \alpha-stable densities, \beta = 0, \gamma = 1, \delta = 0');
legend('\alpha = 0.5',...
    '\alpha = 1.0',...
    '\alpha = 1.8',...
    '\alpha = 2' )

figure(2)
x = -5:.01:5;
beta = 1;
gam = 1;
delta = 0;
plot( x , stblpdf(x,.5,beta,gam,delta,'quick'),...
  x , stblpdf(x,1,beta,gam,delta,'quick'),...
  x , stblpdf(x,1.8,beta,gam,delta,'quick'),...
  x , stblpdf(x,2,beta,gam,delta,'quick') )
axis([-5 5 0 .6]);
title('Skewed \alpha-stable densities, \beta = 0.75,\gamma = 1, \delta = 0');
legend('\alpha = 0.5',...
    '\alpha = 1.0',...
    '\alpha = 1.8',...
    '\alpha = 2' )

figure(3)
X = stblrnd(1.5,0,1,0,1000,1);
hist(X,1000)
xlim([-5 5])