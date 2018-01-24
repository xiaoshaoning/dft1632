function test_dft_209

x = rand(209, 1) + rand(209, 1) * 1i;

y = Gold_Thomas_dft_209(x);
z = fft(x);

if norm(y - z) < 1.0e-13
    disp('test passed.');
else
    disp('test failed.');
end

end