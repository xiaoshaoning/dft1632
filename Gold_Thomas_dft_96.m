% n = N_2 * n_1 + N_1 * n_2 (mod N)
% k = N_2 * mod(<N_2^(-1)>, N_1) * k_1 + N_1 * mod(<N_1^(-1)>, N_2) * k_2 (mod N)
% k_1 in [0, N_1-1], k_2 in [0, N_2-1]

function result = Gold_Thomas_dft_96(x)

if length(x) ~= 96
    error('the length of the input shall be 1632.');
end

x = x(:);

load n_list_32_3;

x_permutated = x(n_list_32_3+1);

x_prime = reshape(x_permutated, 32, 3);

y = zeros(32, 3);
for index = 1:3
    y(:, index) = pfft2(x_prime(:, index));
end

y_reshaped = y.';

z = zeros(3, 32);
for index = 1:32
    z(:, index) = dft_3(y_reshaped(:, index));
end

z_in_a_column = z(:);

load k_list_32_3_inv;

% result = zeros(96, 1);
% result(k_list_32_3+1) = z_in_a_column;

result = z_in_a_column(k_list_32_3_inv);

end