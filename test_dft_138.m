function test_dft_138

x = rand(138, 1) + rand(138, 1) * 1i;

y = Gold_Thomas_dft_138(x);
z = fft(x);

if norm(y - z) < 1.0e-13
    disp('test passed.');
else
    disp('test failed.');
end

end