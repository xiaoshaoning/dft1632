function test_dft_839

x = rand(839, 1) + rand(839, 1) * 1i;

y = dft_839(x);
z = fft(x);

if norm(y - z) < 1.0e-11
    disp('test passed.');
else
    disp('test failed.');
end

end