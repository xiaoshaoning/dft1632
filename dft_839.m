% rader's fft algorithm for N = 839
% based on the fact that 2 is a primitive root of 839

function y = dft_839(x)

if length(x) ~= 839
    error('the length of the input shall be 839.');
end

N = 839;

x = x(:);

y = zeros(839, 1);

y(1) = sum(x);

load power_11_modulo_839_list

w = exp(-2 * 1i * pi .* power_11_modulo_839_list/N);

x_permutated = x(power_11_modulo_839_list + 1);

% z_prime = ifft(fft(w(end:-1:1).') .* fft(x_permutated));

z_prime = conj(Gold_Thomas_dft_838(conj(Gold_Thomas_dft_838(w(end:-1:1).') .* Gold_Thomas_dft_838(x_permutated)))) / 838;

z_tilt = z_prime(end:-1:1);

% [~, b] = sort(mod(2.^(0:837), 839));
load sort_power_11_modulo_839_list_position

y(2:839) = z_tilt(sort_power_11_modulo_839_list_position) + x(1) * ones(838, 1);

end