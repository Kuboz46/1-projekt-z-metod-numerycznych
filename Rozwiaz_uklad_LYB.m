function [Y] = Rozwiaz_uklad_LYB(L, B)
[n, m] = size(B);
Z = zeros(m);
Y = [zeros(n) Z(:,n+1:n)];

for k = 1 : n
    for i = 1:m
        Y(k,i) = (B(k,i) - MojaSuma(k, i, 1, k - 1, L, Y)) / L(k,k);
    end
end

end