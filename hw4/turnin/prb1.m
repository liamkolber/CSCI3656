close all;
format long;

f = @(x) sin(4.8*pi*x);
fprime = @(x) 4.8*pi*cos(4.8*pi*x);
x = 0.2;
k = [3:26];
hplot = 2.^(-k);
i = 1;

front = zeros(1,24);
errFront = zeros(1,24);
back = zeros(1,24);
errBack = zeros(1,24);
center = zeros(1,24);
errCenter = zeros(1,24);

for k = [3:26]
    h = 2^(-k);
    front(i) = (f(x+h) - f(x))/h;
    errFront(i) = abs(fprime(x)-front(i))/abs(fprime(x));
    back(i) = (f(x)- f(x-h))/h;
    errBack(i) = abs(fprime(x)-back(i))/abs(fprime(x));
    center(i) = (f(x+h) - f(x-h))/(2*h);
    errCenter(i) = abs(fprime(x)-center(i))/abs(fprime(x));
    i = i + 1;
end

loglog(hplot,errFront,hplot,errBack,hplot,errCenter)
grid on
xlabel('h')
ylabel('error')
title('Error in Derivative Approximation')
legend('front','back','center','Location','southeast')