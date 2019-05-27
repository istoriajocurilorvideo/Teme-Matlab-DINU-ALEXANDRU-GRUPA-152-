function [xaprox,N] = MetNewton(F,J,x0,eps)
k = 1;
x(1,1) = x0(1);
x(2,1) = x0(2);
while true
    k = k + 1;
    % pentru rezolvare sist de genul Ax = b este
    % x = A \b sau x = inv(A)*b sau x = GaussPivTot(A,b)
    z = J(x(1,k -1),x(2,k-1)) \ (-F(x(1,k-1),x(2,k-1)))
    x( :,k) = z + x(:,k-1);
    if norm(z,2) < eps
        break
    end
end
xaprox = x(:,k);
N = k;
 end