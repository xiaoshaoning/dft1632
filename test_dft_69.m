function test_dft_69

x = rand(69, 1) + rand(69, 1) * 1i;

y = Gold_Thomas_dft_69(x);
z = fft(x);

if norm(y - z) < 1.0e-13
    disp('test passed.');
else
    disp('test failed.');
end

end