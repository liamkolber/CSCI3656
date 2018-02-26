function I = cc(y,a,b,n)
n = n-1;
x = cos(pi*(0:n)'/n);
for j = 1:length(x)
    x(j) = ((b-a)/2)*x(j) + ((b+a)/2);
end

fx = y(x)/(2*n);

g = real(fft(fx([1:n+1 n:-1:2])));
a = [g(1); g(2:n)+g(2*n:-1:n+2); g(n+1)];

w = 0*a';
w(1:2:end) = 2./(1-(0:2:n).^2);
I = w*a;
end



N=N1-1; bma=b-a;
c=zeros(N1,2);
c(1:2:N1,1)=(2./[1 1-(2:2:N).^2 ])'; c(2,2)=1;
f=real(ifft([c(1:N1,:);c(N:-1:2,:)]));
w=bma*([f(1,1); 2*f(2:N,1); f(N1,1)])/2;
x=0.5*((b+a)+N*bma*f(1:N1,2));