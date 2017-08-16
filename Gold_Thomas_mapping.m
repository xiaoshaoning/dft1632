function Gold_Thomas_mapping

N_1 = 96;
N_2 = 17;

n_list = [];

for n_2 = 0:(N_2-1)
    for n_1 = 0:(N_1-1)
        n = mod(17 * n_1 + 96 * n_2, 1632);
%         fprintf('%d\n', n);
        n_list = [n_list; n];
    end
end

save n_list n_list;

k_list = [];

for k_1 = 0:(N_1-1)
    for k_2 = 0:(N_2-1) 
        k = mod(289 * k_1 + 1344 * k_2, 1632);
%         fprintf('%d\n', n);
        k_list = [k_list; k];
    end
end

save k_list k_list;

[~, k_list_inv] = sort(k_list);

save k_list_inv k_list_inv;

end