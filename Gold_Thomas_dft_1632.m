function result = Gold_Thomas_dft_1632(x)

if length(x) ~= 1632
    error('the length of the input shall be 1632.');
end

x = x(:);

load n_list;

x_permutated = x(n_list+1);

x_prime = reshape(x_permutated, 96, 17);

y = zeros(96, 17);
for index = 1:17
    y(:, index) = Gold_Thomas_dft_96(x_prime(:, index));
end

y_reshaped = y.';

z = zeros(17, 96);
for index = 1:96
    z(:, index) = dft_17(y_reshaped(:, index));
end

z_in_a_column = z(:);

load k_list_inv;

% result = zeros(1632, 1);
% result(k_list+1) = z_in_a_column;

result = z_in_a_column(k_list_inv);

end