%% interpolare hermite
clear all
% X = vector x =  variabile
% date de intrare
f = @(x)sin(x); xmin = -pi/2; xmax = pi/2; N =5;
fp =@(x)cos(x);
X = linspace(xmin,xmax,N);
Y = f(X);
plot(X,Y,'o','MarkerFaceColor','g','MarkerSize',10)
hold on
Z = fp(X);
x = pi/6;
[y,z]=MetHermite(X,Y,Z,x)
y
x = linspace(xmin,xmax,100)
[y,z] = MetHermite(X,Y,Z,x)
plot(x,y)
figure(2)
plot (X,Z,'o')

%% problema automobil

T = [0, 3, 5, 8, 14];
D = [0, 225, 383, 623, 993];
V1 = [75, 77, 80, 74, 72];
V2 = [60, 62, 70, 75, 80];

t = linspace(T(1),T(length(T)),50);
[d1,v1] = MetHermite(T,D,V1,t);
[d2,v2] = MetHermite(T,D,V2,t);
d = [d1,d2];
for i = 1 : length(t)
    plot(d1(i),0,'o','MarkerFaceColor','r','MarkerSize',15)
    hold on
    plot(d2(i),0,'o','MarkerFaceColor','b','MarkerSize',8)
    plot(min(d) - 0.1, -0.1, max(d) + 0.1, 0.1)
    grid on; hold off
    M(i) = getframe;
end
movie(M,3,length(t)/3)

%% 