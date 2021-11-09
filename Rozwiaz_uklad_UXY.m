function [X] = Rozwiaz_uklad_UXY(U, Y)
[n, m] = size(Y);
Z = zeros(m);
X = [zeros(n) Z(:,n+1:n)];

for k = n:-1:1
    for i = 1:m
        X(k,i) = Y(k,i) - MojaSuma(k, i, k + 1, n, U, X);
    end
end

end