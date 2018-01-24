% rader's fft algorithm for N = 839
% based on the fact that 2 is a primitive root of 839

function y = dft_419(x)

if length(x) ~= 419
    error('the length of the input shall be 419.');
end

N = 419;

x = x(:);

y = zeros(419, 1);

y(1) = sum(x);

load power_2_modulo_419_list

w = exp(-2 * 1i * pi .* power_2_modulo_419_list/N);

x_permutated = x(power_2_modulo_419_list + 1);

% z_prime = ifft(fft(w(end:-1:1).') .* fft(x_permutated));

z_prime = conj(Gold_Thomas_dft_418(conj(Gold_Thomas_dft_418(w(end:-1:1).') .* Gold_Thomas_dft_418(x_permutated)))) / 418;

z_tilt = z_prime(end:-1:1);

load sort_power_2_modulo_419_list_position

y(2:419) = z_tilt(sort_power_2_modulo_419_list_position) + x(1) * ones(418, 1);

end