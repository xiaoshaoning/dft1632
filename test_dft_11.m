function test_dft_11

x = rand(11, 1) + rand(11, 1) * 1i;

y = dft_11(x);
z = fft(x);

if norm(y - z) < 1.0e-14
    disp('test passed.');
else
    disp('test failed.');
end

end