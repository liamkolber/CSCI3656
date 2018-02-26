function I = trap(y, yprime, a, b, n)
c = linspace(a,b,n);
I = 0;
h = (b-a)/n;
I = (h/2)*(y(a) + y(b));

for k=1:n-1
    I = I + h*y(c(k)) - (((b-a)*h^2)/12)*yprime(c(k));
end