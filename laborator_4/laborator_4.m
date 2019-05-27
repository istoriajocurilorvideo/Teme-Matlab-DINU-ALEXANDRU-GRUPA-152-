R = 2;
y1 = @(x)sqrt(R^2 - x.^2)
y2 = @(x) -sqrt(R^2 - x.^2)
figure(1)
fplot(y1,[-R,R])
hold on
%fplot(f,[xmin,xmax])
fplot(y2,[-R,R])
%o sa fie ca o elipsa
axis equal % o sa fie ca un cerc
grid on
x = @(t) R*cos(t)
y = @(t) R*sin(t)
figure(2)
%fplot(x,y,[tmin,tmax])
fplot(x,y,[0,2*pi])
axis equal
grid on

t = linspace(0,2*pi,60) %img cu punctu
for i = 1:length(t)
    plot(x(t(i)),y(t(i)),'o','MarkerFaceColor','g','MarkerSize',10) 
    hold on
    plot(x(t(1:i)),y(t(1:i)),'LineWidth',3)
    plot(-R,-R) 
    plot(R,R);
    axis equal; grid on;
    M(i) = getframe;
    hold off % pentru a relua
end
movie(M,10,length(t)/2)

%% pentru reprz implicita a unei curbe

F = @(x,y) x.^2 + y.^2 - R^2
fimplicit(F,[-R,R,-R,R])
axis equal
grid on

%fplot(f,[xmin,xmax,ymin,ymax])

%% Tema 4 Exercitiu 1

% x^2 + y^2 = 4
% x^2/8 -y = 0
% l1: x^2 + y^2 = 4
% l2: y = x^2/8
% (x,y) apartine [-3,3] x [-3,3]

F1 = @(x,y) x.^2 + y.^2 -4;
F2 = @(x,y) x.^2/8 - y;
fimplicit(F1,[-3,3,-3,3],'LineWidth',2)
hold on
fimplicit(F2,[-3,3,-3,3])
axis equal
grid on
F = @(x,y)[F1(x,y);F2(x,y)];
syms x y;
f1 = F1(x,y);
f2 = F2(x,y);
% sau putem scrie f2 = x^2/8 -y
J = [diff(f1,x),diff(f1,y);diff(f2,x),diff(f2,y)];
J = matlabFunction(J,'vars',{x,y}); % poate juca rolul unui parametru de intrare
x0 = [-2;0];
eps = 10^(-5);

[xaprox,N] = MetNewton(F,J,x0,eps);
xaprox
plot(xaprox(1),xaprox(2),'o','MarkerFaceColor','r','MarkerSize',10)


x0 = [2,0];
tic;
[xaprox,N] = Newton(F, J, x0 ,eps);
tex = toc;
tex
plot(xaprox(1,1),xaprox(2,1),'o','MarkerFaceColor','g','MarkerSize',10)
hold off

%% Tema 4 exercitiul 2
F1 = @(x1,x2) x1.^2 - x1.*10 + x2.^2 + 8;
F2 = @(x1,x2) x1.*x2.^2 + x1 - x2.*10 + 8;
fimplicit(F1,[0,5,0,5],'Linewidth',2)
hold on
axis equal
fimplicit(F2,[0,5,0,5],'r','Linewidth',2)
hold on
grid on
F = @(x,y)[F1(x,y);F2(x,y)];
syms x y;
f1 = F1(x,y);
f2 = F2(x,y);
J = [diff(f1,x),diff(f1,y);diff(f2,x),diff(f2,y)];
J = matlabFunction(J,'vars',{x,y});
x0 = [1;1];
eps = 10^(-5);

[xaprox,N] = MetNewton(F,J,x0,eps);
xaprox
plot(xaprox(1),xaprox(2),'o','MarkerFaceColor','r','MarkerSize',10)

x0 = [3,2.2];
tic;
[xaprox,N] = MetNewton(F, J, x0 ,eps);
tex = toc;
tex
plot(xaprox(1,1),xaprox(2,1),'o','MarkerFaceColor','g','MarkerSize',10)
hold off
%% Lagrange
% metoda directa

%f = @(x) sin(x)
%x = linspace( -pi/2,pi/2,5)
xmin = -6;
xmax = 6;
f = @(x) 1./(1+x.^2)
x = linspace( xmin,xmax,20)

y = f(x);
a = MetDirecta(x,y)
plot(x,y,'o')
hold on

syms X;
Pn = 0;
for i = 1 : length(a)
    Pn = Pn + a(i)*X^(i-1)
end
Pn = matlabFunction(Pn,'vars',{X})
fplot(Pn,[xmin,xmax])