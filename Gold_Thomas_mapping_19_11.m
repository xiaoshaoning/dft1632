function Gold_Thomas_mapping_19_11

N_1 = 19;
N_2 = 11;

n_list_19_11 = [];

for n_2 = 0:(N_2-1)
    for n_1 = 0:(N_1-1)
        n = mod(11 * n_1 + 19 * n_2, 209);
%         fprintf('%d\n', n);
        n_list_19_11 = [n_list_19_11; n]; %#ok<AGROW>
    end
end

save n_list_19_11 n_list_19_11;

k_list_19_11 = [];

for k_1 = 0:(N_1-1)
    for k_2 = 0:(N_2-1) 
        k = mod(77 * k_1 + 133 * k_2, 209); % 11^(-1) = 7 (mod 19),  19^(-1) = 7 (mod 11)
%         fprintf('%d\n', n);
        k_list_19_11 = [k_list_19_11; k]; %#ok<AGROW>  
    end
end

save k_list_19_11 k_list_19_11;

[~, k_list_19_11_inv] = sort(k_list_19_11);

save k_list_19_11_inv k_list_19_11_inv;

end