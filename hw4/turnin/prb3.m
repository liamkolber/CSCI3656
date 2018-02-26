close all
format long

f = @(x) cos(3*pi*x);
fprime = @(x) -3*pi*sin(3*pi*x);
fint = @(x) (1/(3*pi))*sin(3*pi*x);

a = 1;
b = 1.5;
k = [1:1:10];
nplot = 2.^k + 1;
iSimp = zeros(1,length(k));
errSimp = zeros(1,length(k));
iTrap = zeros(1,length(k));
errTrap = zeros(1,length(k));
iCC = zeros(1,length(k));
errCC = zeros(1,length(k));

defInt = fint(b)-fint(a);

for i = 1:length(k)
    n = 2^k(i) + 1;
    iSimp(i) = simpsons(f,a,b,n);
    errSimp(i) = abs(defInt-iSimp(i))/abs(defInt);
    iTrap(i) = trap(f,fprime,a,b,n);
    errTrap(i) = abs(defInt-iTrap(i))/abs(defInt);
    iCC(i) = quadcc(f,a,b,1e-25,4);
    errCC(i) = abs(defInt-iCC(i))/abs(defInt);
end

loglog(nplot,errTrap, nplot,errSimp, nplot,errCC)
grid on
xlabel('n')
ylabel('error')
title('Error in Derivative Approximation')
legend('Trapezoidal','Simpson','Clenshaw-Curtis','Location','southwest')