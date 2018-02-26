close all
clear all
format long

[y,X,labels] = process_datafile("winequality-red.csv");

e = ones(size(X,1), 1);
[b, bint, r, rint, stats] = regress(y,[e X]);

hist(r);
title('Residuals of Linear Model');
xlabel('Residuals');
ylabel('Frequency');

%r^2 stat is the first column
r_2 = stats(1);

avgs = zeros(11,1);
for i = 1:11
    avgs(i) = mean(X(:,i));
end
wine = [5.1,0.3,0.8,11.0,0.2,68.5,15.7,1.0,3.2,1.6,13.6];
changes = avgs-wine.';

y = zeros(length(X),1);
y(:) = b(1);
b = b.';
for i = 1:length(X)
    S = b(2:end).*X(i,:);
    S = sum(S);
    y(i) = y(i) + S;
end

sig_y = std(y);
sig_x = std(X);

B_i = zeros(length(labels),1);

for i = 1:length(labels)-1
   B_i(i) = abs(b(i+1) * (sig_x(i)/sig_y));
end

labels = labels(1:end-1)
B_i = B_i(1:end-1)

table(labels,avgs,B_i)
table(labels,changes)