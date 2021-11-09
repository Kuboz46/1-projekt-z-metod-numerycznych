function e = blad_wzgledny(rozw_otrz, rozw_pop)
% Funkcja przyjmuje rozwi¹zanie otrzymane oraz rozwi¹zanie poprawne.
e = norm(rozw_otrz - rozw_pop) / norm(rozw_pop);
disp('B³¹d wzglêdny:');
disp(e);
end

