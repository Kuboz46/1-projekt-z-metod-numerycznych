function wsp_pop = wspolczynnik_poprawnosci(A, B, rozw_otrz)
wsp_pop = norm(B - A * rozw_otrz) / (norm(A) * norm(rozw_otrz));
disp('Wspó³czynnik poprawnoœci:');
disp(wsp_pop);
end

