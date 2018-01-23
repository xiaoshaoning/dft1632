% rader's fft algorithm for N = 139
% based on the fact that 2 is a primitive root of 139

function y = dft_139(x)

if length(x) ~= 139
    error('the length of the input shall be 139.');
end

N = 139;

x = x(:);

y = zeros(139, 1);

y(1) = sum(x);

w = exp(-2 * 1i * pi .* mod(2.^(0:137), 139)/N);

x_permutated = x(mod(2.^(0:137), 139) + 1);

% z_prime = ifft(fft(w(end:-1:1).') .* fft(x_permutated));

z_prime = conj(Gold_Thomas_dft_138(conj(Gold_Thomas_dft_138(w(end:-1:1).') .* Gold_Thomas_dft_138(x_permutated)))) / 138;

z_tilt = z_prime(end:-1:1);

[~, b] = sort(mod(2.^(0:137), 139));

y(2:139) = z_tilt(b) + x(1) * ones(138, 1);

end