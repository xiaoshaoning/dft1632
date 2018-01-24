function test_dft_419

x = rand(419, 1) + rand(419, 1) * 1i;

y = dft_419(x);
z = fft(x);

if norm(y - z) < 1.0e-12
    disp('test passed.');
else
    disp('test failed.');
end

end