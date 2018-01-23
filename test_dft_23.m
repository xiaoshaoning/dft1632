function test_dft_23

x = rand(23, 1) + rand(23, 1) * 1i;

y = dft_23(x);
z = fft(x);

if norm(y - z) < 9.0e-15
    disp('test passed.');
else
    disp('test failed.');
end

end