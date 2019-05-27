function [y,z] = MetHermite(X,Y,Z,x)
% parm variabile
n = length(X) -1;
Her = 0;
    for k = 1 : n + 1
        L = ones(size(x));  Lpk =zeros(size(x));
        for j = 1 : n + 1
            if j ~=k
                L  = L.* ( x - X(j))./(X(k) - X(j));
                Lpk  = Lpk + 1./(X(k) - X(j));
            end
        end
        H = L.^2.* ( 1 - 2* Lpk.*(x - X(k)));
        K = L.^2.*(x-X(k));
        Her = Her + H.* Y(k) + K.* Z (k);
    end
    y = Her;
    z = []; % urmeaza sa fie calculat
end
