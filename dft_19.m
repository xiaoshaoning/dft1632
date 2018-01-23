% rader's fft algorithm for N = 19
% based on the fact that 2 is a primitive root of 19

function y = dft_19(x)

if length(x) ~= 19
    error('the length of the input shall be 19.');
end

N = 19;

x = x(:);

y = zeros(19, 1);

y(1) = sum(x);

w = [exp(-2 * 1i * pi / N), exp(-2 * 1i * pi *2 / N), exp(-2 * 1i * pi * 4 / N), exp(-2 * 1i * pi * 8 / N), ...
    exp(-2 * 1i * pi * 16 / N), exp(-2 * 1i * pi * 13 / N), exp(-2 * 1i * pi * 7 / N), exp(-2 * 1i * pi * 14/ N), ...    
    exp(-2 * 1i * pi * 9 / N), exp(-2 * 1i * pi * 18 / N), exp(-2 * 1i * pi * 17 / N), exp(-2 * 1i * pi * 15/ N), ...
    exp(-2 * 1i * pi * 11/ N), exp(-2 * 1i * pi * 3/ N), exp(-2 * 1i * pi * 6 / N), exp(-2 * 1i * pi * 12/ N), ...
    exp(-2 * 1i * pi * 5/N), exp(-2 * 1i * pi * 10/N)]; % mod(2.^(0:17), 19) 

W = [w; circshift(w, -1); circshift(w, -2); circshift(w, -3); ...
    circshift(w, -4); circshift(w, -5); circshift(w, -6); circshift(w, -7); ...
    circshift(w, -8); circshift(w, -9); circshift(w, -10); circshift(w, -11); ...
    circshift(w, -12); circshift(w, -13); circshift(w, -14); circshift(w, -15); circshift(w, -16); circshift(w, -17)];

x_permutated = x([2; 3; 5; 9; 17; 14; 8; 15; 10; 19; 18; 16; 12; 4; 7; 13; 6; 11]); % mod(2.^(0:17), 19) + 1

z = W * x_permutated;

y(2:19) = z([1 2 14 3 17 15 7 4 9 18 13 16 6 8 12 5 11 10]) + x(1) * ones(18, 1); % [~, b] = sort(mod(2.^(0:17), 19));

end