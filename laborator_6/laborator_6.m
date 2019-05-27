f = @(x)sin(x);
fp = @(x)cos(x);
fs = @(x)(-sin(x));

xmin = -pi/2;
xmax = pi/2;
N = 12;
X = linspace(xmin,xmax,N+1);
Y = f(X);

figure(1);
plot(X,Y,'o');
figure(2);
fplot(fp,[xmin,xmax]);
figure(3);
fplot(fs,[xmin,xmax]);

x = linspace(xmin,xmax,100);
fpA = fp(xmin);
fpB = fp(xmax);

[y,z,t] = MetSplineCubic(X,Y,x,fpA,fpB);

figure(1);
hold on;
plot(x,y,'Linewidth',3)

figure(2);
hold on;
plot(x,z,'Linewidth',2)

% Interp1

y = spline(X,[fpA Y fpB],x);
figure(1);
plot(x,y,'g')

%% Metoda Richardson

f = @(x) 1./(1+x.^2);
syms X;
fp = diff(f(X),X);
fp = matlabFunction(fp,'vars',{X});

xmin = -6;
xmax = 6;
% n acum e ordinul de aproximare
N = 2;

x = linspace(xmin,xmax,100);
h = abs(x(1) - x(2));
y = f(x);

figure(1);
hold on;
subplot(4,2,2);
fplot(fp,[xmin,xmax]);

subplot(4,2,1);
fplot(f,[xmin,xmax]);

subplot(4,2,3);

for i = 1: length(x)
    df(i) = MetRichardson(f,x(i),h,N);
    err(i) = abs(fp(x(i)) - df(i));
end

plot(x,df);

subplot(4,2,4);
for i = 1: length(x)
    df(i) = MetRichardson(f,x(i),h,N);
    err(i) = abs(fp(x(i)) - df(i));
end

plot(x,df);

subplot
for i = 1: length(x)
    df(i) = MetRichardson(f,x(i),h,N);
    err(i) = abs(fp(x(i)) - df(i));
end

plot(x,df);

