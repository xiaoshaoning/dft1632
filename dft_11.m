% rader's fft algorithm for N = 11
% based on the fact that 2 is a primitive root of 11

function y = dft_11(x)

if length(x) ~= 11
    error('the length of the input shall be 13.');
end

N = 11;

x = x(:);

y = zeros(11, 1);

y(1) = sum(x);

w = [exp(-2 * 1i * pi / N), exp(-2 * 1i * pi *2 / N), exp(-2 * 1i * pi * 4 / N), exp(-2 * 1i * pi * 8 / N), ...
    exp(-2 * 1i * pi * 5 / N), exp(-2 * 1i * pi * 10 / N), exp(-2 * 1i * pi * 9 / N), exp(-2 * 1i * pi * 7/ N), ...    
    exp(-2 * 1i * pi * 3 / N), exp(-2 * 1i * pi * 6 / N)];  % mod(2.^(0:9), 11) 

W = [w; circshift(w, -1); circshift(w, -2); circshift(w, -3); ...
    circshift(w, -4); circshift(w, -5); circshift(w, -6); circshift(w, -7); ...
    circshift(w, -8); circshift(w, -9)];

x_permutated = x([2; 3; 5; 9; 6; 11; 10; 8; 4; 7]); % mod(2.^(0:9), 11) + 1

z = W * x_permutated;

y(2:11) = z([1 2 9 3 5 10 8 4 7 6]) + x(1) * ones(10, 1); % [~, b] = sort(mod(2.^(0:9), 11));
end