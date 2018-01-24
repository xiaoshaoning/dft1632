function power_calc

input = 11;

power_11_modulo_839_list = ones(1, 838);

for k = 0:837
    for index = 0:k-1      
         power_11_modulo_839_list(k+1) = mod(input * power_11_modulo_839_list(k+1), 839);
    end
end

disp(power_11_modulo_839_list);

save power_11_modulo_839_list power_11_modulo_839_list

[~, sort_power_11_modulo_839_list_position] = sort(power_11_modulo_839_list);

save sort_power_11_modulo_839_list_position sort_power_11_modulo_839_list_position