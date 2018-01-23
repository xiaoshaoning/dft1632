function test_dft_139

x = rand(139, 1) + rand(139, 1) * 1i;

y = dft_139(x);
z = fft(x);

if norm(y - z) < 1.0e-13
    disp('test passed.');
else
    disp('test failed.');
end

end