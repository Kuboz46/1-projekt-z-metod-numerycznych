% MENU
clear 
clc
zakoncz_program = 8;
kontrol = 1;
while kontrol ~= zakoncz_program
    kontrol=menu('Menu', 'Rozwi¹¿ równanie AX = B metod¹ Crouta.', 'Rozwi¹¿ równanie AX = B z wbudowan¹ funkcj¹ inv.', 'Podaj macierz A', 'Podaj macierz B', 'Wyznacz det(A) ', 'Wyznacz det(A) (wbudowan¹ funkcj¹ det)', ' Podaj b³¹d przybli¿enia.', 'FINISH');
    switch kontrol
        case 1
            [a, b] = size(A);
            if (a ~= b )
                disp('Macierz A nie jest kwadratowa!');
                continue;
            end
            n = max(size(A));
            [c, d] = size(B);
            if (n ~= c)
                disp('Liczba wierszy macierzy A nie jest równa liczbie wierszy macierzy B!');
                continue;
            end
            L = zeros(n);
            U = eye(n);

            for k = 1 : n
                for i = k : n
                    L(i,k) = A(i, k) - MojaSuma(i, k, 1, k - 1, L, U);
                end
                for j = k + 1 : n
                    U(k, j) = (A(k, j) - MojaSuma(k, j, 1, k - 1, L, U)) / L(k, k);
                end
            end
            y = Rozwiaz_uklad_LYB(L, B); % Moja funkcja -tutaj L jest trojkatna dolna
            x = Rozwiaz_uklad_UXY(U, y);  % Moja funkcja -tutaj U jest trojkatna gorna
        case 2
            [a, b] = size(A);
            if (a ~= b )
                disp('Macierz A nie jest kwadratowa!');
                continue;
            end
            n = max(size(A));
            [c, d] = size(B);
            if (n ~= c)
                disp('Liczba wierszy macierzy A nie jest równa liczbie wierszy macierzy B!');
                continue;
            end
            x = A\B
        case 3
            A = input('Podaj A.');
        case 4
            B = input('Podaj B.');
        case 5
            wyz = wyznacznik_macierzy_trojkatnej(L); % wyznacznik_macierzy_trojkatnej(U) = 1, bo na przek¹tnej ma 1-ki
            disp('Wyznacznik macierz A wynosi:');
            disp(wyz);
        case 6
            disp('Wyznacznik macierz A wynosi:');
            disp(det(A));
        case 7
            e=norm(A-L*U)/norm(A);
            disp('B³¹d przybli¿enia wynosi: ');
            disp(e);
        case 8
            disp('Koniec programu');
            return;
    end  
end