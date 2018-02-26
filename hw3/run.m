close all
format long
k = [1:8];
n = 2.^k + 1;
condition = [];
for i = 1:max(k)
    A_n = vandermonde(n(i),n(i)-1);
    condition(i) = cond(A_n);
end

figure(1)
semilogy(n,log(condition));
xlabel('n')
ylabel('Condition')
title('Condition for a given n')
grid;
%-------------------------------------
x = [-1:2/100:1];
x = x(1:end-1);
fx = 2+x+x.*sin(2*pi.*x);


X = [];
Y = [];
n = 33;
vndr = vandermonde(n,3);
for i = 1:33
    X(i) = -1 + 2*((i-1)/(n-1));
    Y(i) = 2+X(i)+X(i)*sin(2*pi*X(i));
end
C = vndr\Y';

p = [];
for i = 1:33
    ptemp = 0;
    for d = 1:4
        ptemp = ptemp + C(d)*X(i)^(d-1);
    end
    p(i) = ptemp;
end

figure(2)
plot(x,fx,'r')
hold on
plot(X,p,'b')
xlabel('x')
ylabel('f(x)')
title('f(x) vs the 3rd degree interpolation')
legend('f(x)','interpolation','Location','northwest')
grid;
%-------------------------------------
x = [-1:2/32:1];
fx2 = 2+x+x.*sin(2*pi.*x);
P = [];
ed = [];
dForPlot = [1:31];
n = 100;
for D = 1:31
    vndr = vandermonde(n,D);
    X = [];
    Y = [];

    for i = 1:n
        X(i) = -1 + 2*((i-1)/(n-1));
        Y(i) = 2+X(i)+X(i)*sin(2*pi*X(i));
    end
    C = vndr\Y';

    pnew = [];
    for i = 1:n
        ptemp = 0;
        for d = 1:D
            ptemp = ptemp + C(d)*X(i)^(d-1);
        end
        pnew(i) = ptemp;
    end
    ed(D) = max(abs(Y-pnew)./abs(Y));
end

figure(3)
semilogy(dForPlot,ed)
xlabel('d')
ylabel('error')
title('error vs. the degree of polynomial')
grid














