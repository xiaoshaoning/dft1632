function test_dft_418

x = rand(418, 1) + rand(418, 1) * 1i;

y = Gold_Thomas_dft_418(x);
z = fft(x);

if norm(y - z) < 1.0e-12
    disp('test passed.');
else
    disp('test failed.');
end

end