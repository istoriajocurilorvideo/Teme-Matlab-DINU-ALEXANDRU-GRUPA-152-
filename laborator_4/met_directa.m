function [a] = MetDirecta(x,y)
n = length(x);
for i = 1 : n
    A(i,1) = 1;
end
for i = 1:n
    for j = 2:n
        A(i,j) = x(i)^(j-1)
    end
end
if size(y,1) == n
a = MetGaussPT(A,y);
else
    a = MetGaussPT(A,transpose(y))
end
end