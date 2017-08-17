function test_dft_96

x = rand(96, 1) + rand(96, 1) * 1i;

y = Gold_Thomas_dft_96(x);
z = fft(x);

if norm(y - z) < 1.0e-13
    disp('test passed.');
else
    disp('test failed.');
end

end