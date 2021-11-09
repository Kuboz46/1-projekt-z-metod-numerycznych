function wyz = wyznacznik_macierzy_trojkatnej(A)
% funkcja licz¹ca wyznacznik macierzy trójk¹tnej A
% Jakub Zbrzezny

wyz = 1;
n = max(size(A));

for i = 1 : n
    wyz = wyz * A(i, i);
end

