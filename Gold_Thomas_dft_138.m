% n = N_2 * n_1 + N_1 * n_2 (mod N)
% k = N_2 * mod(<N_2^(-1)>, N_1) * k_1 + N_1 * mod(<N_1^(-1)>, N_2) * k_2 (mod N)
% k_1 in [0, N_1-1], k_2 in [0, N_2-1]

function result = Gold_Thomas_dft_138(x)

if length(x) ~= 138
    error('the length of the input shall be 138.');
end

x = x(:);

load n_list_69_2;

x_permutated = x(n_list_69_2+1);

x_prime = reshape(x_permutated, 69, 2);

y = zeros(69, 2);
for index = 1:2
    y(:, index) = fft(x_prime(:, index));
end

y_reshaped = y.';

z = zeros(2, 69);
for index = 1:69
    z(:, index) = fft(y_reshaped(:, index));
end

z_in_a_column = z(:);

load k_list_69_2_inv;

result = z_in_a_column(k_list_69_2_inv);

end