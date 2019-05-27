function [y,z,t] = MetSplineCubic(X,Y,x,fpA,fpB)

n = length(X) -1;

for j=1:n
    a(j) = Y(j);
end

B(1,1) = 1;
B(n+1,n+1) =1;

for j = 2:n
    B(j,j) = 4;
    B(j,j+1) =1;
    B(j,j-1) = 1;
end

w(1) = fpA;
w(n+1) = fpB;

h = X(2)-X(1);

for j = 2:n
    w(j) = (3/h)*(Y(j+1) - Y(j-1))
end

b = B\transpose(w);

for j = 1:n
    d(j) = (-2/(h^3))*(Y(j+1) - Y(j)) + (1/(h^2))*(b(j+1) + b(j));
    c(j) = (3/(h^2))*(Y(j+1) - Y(j)) - (b(j+1) + 2*b(j))/h
end

for i = 1: length(x)

for j =1:n
    if x(i)>= X(j) & x(i)<=X(j+1)
        S = a(j) + b(j)*(x(i)-X(j)) + c(j)*(x(i)-X(j))^2 + d(j)*(x(i)-X(j))^3;
        Sp = b(j) + 2*c(j)*(x(i)-X(j)) + 3*d(j)*(x(i)-X(j))^2;
        % SS derivata a doua
        SS = 2*c(j) + 6*d(j)*(x(i)-X(j));
        break;
    end
end

    y(i)= S;
    z(i) = Sp;
    t(i) = SS;
    
end
end