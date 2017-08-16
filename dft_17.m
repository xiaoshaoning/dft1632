% rader's fft algorithm for N = 17
% based on the fact that 3 is a primitive root of 17

function y = dft_17(x)

if length(x) ~= 17
    error('the length of the input shall be 17.');
end

N = 17;

x = x(:);

y = zeros(17, 1);

y(1) = sum(x);

w = [exp(-2 * 1i * pi / N), exp(-2 * 1i * pi *3 / N), exp(-2 * 1i * pi * 9 / N), exp(-2 * 1i * pi * 10 / N), ...
    exp(-2 * 1i * pi * 13 / N), exp(-2 * 1i * pi * 5 / N), exp(-2 * 1i * pi * 15 / N), exp(-2 * 1i * pi * 11/ N), ...    
    exp(-2 * 1i * pi * 16 / N), exp(-2 * 1i * pi * 14 / N), exp(-2 * 1i * pi * 8 / N), exp(-2 * 1i * pi * 7/ N), ...
    exp(-2 * 1i * pi * 4/ N), exp(-2 * 1i * pi * 12/ N), exp(-2 * 1i * pi * 2 / N), exp(-2 * 1i * pi * 6/ N)];

W = [w; circshift(w, -1); circshift(w, -2); circshift(w, -3); ...
    circshift(w, -4); circshift(w, -5); circshift(w, -6); circshift(w, -7); ...
    circshift(w, -8); circshift(w, -9); circshift(w, -10); circshift(w, -11); ...
    circshift(w, -12); circshift(w, -13); circshift(w, -14); circshift(w, -15)];

x_permutated = x([2; 4; 10; 11; 14; 6; 16; 12; 17; 15; 9; 8; 5; 13; 3; 7]);

z = W * x_permutated;

y(2:17) = z([1; 15; 2; 13; 6; 16; 12; 11; 3; 4; 8; 14; 5; 10; 7; 9]) + x(1) * ones(16, 1);

end