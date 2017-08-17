function test_dft_3

x = rand(3, 1) + rand(3, 1) * 1i;

y = dft_3(x);
z = fft(x);

if norm(y - z) < 1.0e-13
    disp('test passed.');
else
    disp('test failed.');
end

end