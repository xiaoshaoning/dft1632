% n = N_2 * n_1 + N_1 * n_2 (mod N)
% k = N_2 * mod(<N_2^(-1)>, N_1) * k_1 + N_1 * mod(<N_1^(-1)>, N_2) * k_2 (mod N)
% k_1 in [0, N_1-1], k_2 in [0, N_2-1]

function result = Gold_Thomas_dft_209(x)

if length(x) ~= 209
    error('the length of the input shall be 209.');
end

x = x(:);

load n_list_19_11;

x_permutated = x(n_list_19_11+1);

x_prime = reshape(x_permutated, 19, 11);

y = zeros(19, 11);
for index = 1:11
%     y(:, index) = fft(x_prime(:, index));
    y(:, index) = dft_19(x_prime(:, index));
end

y_reshaped = y.';

z = zeros(11, 19);
for index = 1:19
     z(:, index) = dft_11(y_reshaped(:, index));
end

z_in_a_column = z(:);

load k_list_19_11_inv;

result = z_in_a_column(k_list_19_11_inv);

end