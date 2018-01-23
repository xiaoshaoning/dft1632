function Gold_Thomas_mapping_69_2

N_1 = 69;
N_2 = 2;

n_list_69_2 = [];

for n_2 = 0:(N_2-1)
    for n_1 = 0:(N_1-1)
        n = mod(2 * n_1 + 69 * n_2, 138);
%         fprintf('%d\n', n);
        n_list_69_2 = [n_list_69_2; n]; %#ok<AGROW>
    end
end

save n_list_69_2 n_list_69_2;

k_list_69_2 = [];

for k_1 = 0:(N_1-1)
    for k_2 = 0:(N_2-1) 
        k = mod(70 * k_1 + 69 * k_2, 138); % 2^(-1) = 35 (mod 69),  69^(-1) = 1 (mod 2)
%         fprintf('%d\n', n);
        k_list_69_2 = [k_list_69_2; k]; %#ok<AGROW>  
    end
end

save k_list_69_2 k_list_69_2;

[~, k_list_69_2_inv] = sort(k_list_69_2);

save k_list_69_2_inv k_list_69_2_inv;

end