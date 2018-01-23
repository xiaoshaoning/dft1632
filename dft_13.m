% rader's fft algorithm for N = 13
% based on the fact that 2 is a primitive root of 13

function y = dft_13(x)

if length(x) ~= 13
    error('the length of the input shall be 13.');
end

N = 13;

x = x(:);

y = zeros(13, 1);

y(1) = sum(x);

w = [exp(-2 * 1i * pi / N), exp(-2 * 1i * pi *2 / N), exp(-2 * 1i * pi * 4 / N), exp(-2 * 1i * pi * 8 / N), ...
    exp(-2 * 1i * pi * 3 / N), exp(-2 * 1i * pi * 6 / N), exp(-2 * 1i * pi * 12 / N), exp(-2 * 1i * pi * 11/ N), ...    
    exp(-2 * 1i * pi * 9 / N), exp(-2 * 1i * pi * 5 / N), exp(-2 * 1i * pi * 10 / N), exp(-2 * 1i * pi * 7/ N)];  % mod(2.^(0:11), 13) 

W = [w; circshift(w, -1); circshift(w, -2); circshift(w, -3); ...
    circshift(w, -4); circshift(w, -5); circshift(w, -6); circshift(w, -7); ...
    circshift(w, -8); circshift(w, -9); circshift(w, -10); circshift(w, -11)];

x_permutated = x([2; 3; 5; 9; 4; 7; 13; 12; 10; 6; 11; 8]); % mod(2.^(0:11), 13) + 1

z = W * x_permutated;

y(2:13) = z([1 2 5 3 10 6 12 4 9 11 8 7]) + x(1) * ones(12, 1); % [~, b] = sort(mod(2.^(0:11), 13)); b = [1 2 5 3 10 6 12 4 9 11 8 7]

end