% n = N_2 * n_1 + N_1 * n_2 (mod N)
% k = N_2 * mod(<N_2^(-1)>, N_1) * k_1 + N_1 * mod(<N_1^(-1)>, N_2) * k_2 (mod N)
% k_1 in [0, N_1-1], k_2 in [0, N_2-1]

function result = Gold_Thomas_dft_69(x)

if length(x) ~= 69
    error('the length of the input shall be 69.');
end

x = x(:);

load n_list_23_3;

x_permutated = x(n_list_23_3+1);

x_prime = reshape(x_permutated, 23, 3);

y = zeros(23, 3);
for index = 1:3
    y(:, index) = fft(x_prime(:, index));
end

y_reshaped = y.';

z = zeros(3, 23);
for index = 1:23
    z(:, index) = fft(y_reshaped(:, index));
end

z_in_a_column = z(:);

load k_list_23_3_inv;

result = z_in_a_column(k_list_23_3_inv);

end