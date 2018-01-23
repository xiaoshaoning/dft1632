% rader's fft algorithm for N = 23
% based on the fact that 5 is a primitive root of 23

function y = dft_23(x)

if length(x) ~= 23
    error('the length of the input shall be 23.');
end

N = 23;

x = x(:);

y = zeros(23, 1);

y(1) = sum(x);

w = [exp(-2 * 1i * pi / N), exp(-2 * 1i * pi *5 / N), exp(-2 * 1i * pi * 2 / N), exp(-2 * 1i * pi * 10 / N), ...
    exp(-2 * 1i * pi * 4 / N), exp(-2 * 1i * pi * 20 / N), exp(-2 * 1i * pi * 8 / N), exp(-2 * 1i * pi * 17/ N), ...    
    exp(-2 * 1i * pi * 16 / N), exp(-2 * 1i * pi * 11 / N), exp(-2 * 1i * pi * 9 / N), exp(-2 * 1i * pi * 22/ N), ...
    exp(-2 * 1i * pi * 18/ N), exp(-2 * 1i * pi * 21/ N), exp(-2 * 1i * pi * 13 / N), exp(-2 * 1i * pi * 19/ N), ...
    exp(-2 * 1i * pi * 3/N), exp(-2 * 1i * pi * 15/N), exp(-2 * 1i * pi * 6/N), exp(-2 * 1i * pi * 7/N), ...
    exp(-2 * 1i * pi * 12/N), exp(-2 * 1i * pi * 14/N)]; % mod(2.^(0:21), 23) 

W = [w; circshift(w, -1); circshift(w, -2); circshift(w, -3); ...
    circshift(w, -4); circshift(w, -5); circshift(w, -6); circshift(w, -7); ...
    circshift(w, -8); circshift(w, -9); circshift(w, -10); circshift(w, -11); ...
    circshift(w, -12); circshift(w, -13); circshift(w, -14); circshift(w, -15); ...
    circshift(w, -16); circshift(w, -17); circshift(w, -18); circshift(w, -19); ...
    circshift(w, -20); circshift(w, -21)];

x_permutated = x([2; 6; 3; 11; 5; 21; 9; 18; 17; 12; 10; 23; 19; 22; 14; 20; 4; 16; 7; 8; 13; 15]); % mod(5.^(0:21), 23) + 1

z = W * x_permutated;

% z_prime = conj(ifft(fft(W(:, 1)) .* conj(fft(x_permutated))));
% 
% z_tilt = fftshift(z_prime);

z_prime = ifft(fft(W(end:-1:1, 1)) .* fft(x_permutated));
z_tilt = z_prime(end:-1:1);

y(2:23) = z_tilt([1 3 17 5 2 19 20 7 11 4 10 21 15 22 18 9 8 13 16 6 14 12]) + x(1) * ones(22, 1); % [~, b] = sort(mod(5.^(0:21), 23));

end