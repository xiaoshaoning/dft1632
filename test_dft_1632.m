function test_dft_1632

x = rand(1632, 1) + rand(1632, 1) * 1i;

y = Gold_Thomas_dft_1632(x);
z = fft(x);

if norm(y - z) < 1.0e-12
    disp('test passed.');
else
    disp('test failed.');
end

end