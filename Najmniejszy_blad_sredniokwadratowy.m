function c = Najmniejsze_odchylenie_sredniokwadratowe(G, M, f)
% Funkcja wyznacza c = (c_0, c_1, c_2, ..., c_n)' tak, aby znimalizowaæ
% wartoœæ odchylenia œredniokwadratowego g(c_0, c_1, c_2, ..., c_n) = (f_0 - q(x_0))^2 + .... +
% (f_n - q(x_n))^2, gdzie f jest funkcj¹ aproksymowan¹, natomiast q funkjc¹
% aproksymuj¹c¹.
g = M' * f;
[a, b] = size(G);
            if (a ~= b)
                disp('Macierz A nie jest kwadratowa!');
                continue;
            end
            n = max(size(A));
            [e, f] = size(B);
            if (n ~= e)
                disp('Liczba wierszy macierzy A nie jest równa liczbie wierszy macierzy B!');
                continue;
            end
            if(rank(G) ~= n)
                disp('Wyznacznik macierzy G jest równy 0!');
                continue;
            end 
            L = zeros(n);
            U = eye(n);

            for k = 1 : n
                for i = k : n
                    L(i,k) = G(i, k) - MojaSuma(i, k, 1, k - 1, L, U);
                end
                for j = k + 1 : n
                    U(k, j) = (G(k, j) - MojaSuma(k, j, 1, k - 1, L, U)) / L(k, k);
                end
            end
            y = Rozwiaz_uklad_LYB(L, g); % Moja funkcja -tutaj L jest trojkatna dolna
            c = Rozwiaz_uklad_UXY(U, y);  % Moja funkcja -tutaj U jest trojkatna gorna
end

