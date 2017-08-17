function Gold_Thomas_mapping_32_3

N_1 = 32;
N_2 = 3;

n_list_32_3 = [];

for n_2 = 0:(N_2-1)
    for n_1 = 0:(N_1-1)
        n = mod(3 * n_1 + 32 * n_2, 96);
%         fprintf('%d\n', n);
        n_list_32_3 = [n_list_32_3; n]; %#ok<AGROW>
    end
end

save n_list_32_3 n_list_32_3;

k_list_32_3 = [];

for k_1 = 0:(N_1-1)
    for k_2 = 0:(N_2-1) 
        k = mod(33 * k_1 + 64 * k_2, 96); % 3^(-1) = 11 (mod 32),  32^(-1) = 2 (mod 3)
%         fprintf('%d\n', n);
        k_list_32_3 = [k_list_32_3; k]; %#ok<AGROW>  
    end
end

save k_list_32_3 k_list_32_3;

[~, k_list_32_3_inv] = sort(k_list_32_3);

save k_list_32_3_inv k_list_32_3_inv;

end