function y = MojaSuma(i, k, l, m, L, U)
% funkcja licz¹ca sumê od l do m L(i,p)*U(p,k)

y = 0;
for p = l : m
    y = y + L(i,p) * U(p,k);
end
