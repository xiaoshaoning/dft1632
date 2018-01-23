function test_dft_19

x = rand(19, 1) + rand(19, 1) * 1i;

y = dft_19(x);
z = fft(x);

if norm(y - z) < 9.0e-15
    disp('test passed.');
else
    disp('test failed.');
end

end