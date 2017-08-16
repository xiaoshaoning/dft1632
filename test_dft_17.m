function test_dft_17

x = rand(17, 1) + rand(17, 1) * 1i;

y = dft_17(x);
z = fft(x);

if norm(y - z) < 1.0e-13
    disp('test passed.');
else
    disp('test failed.');
end

end