function power_2_modulo_419_list = power_calc_419

input = 2;

power_2_modulo_419_list = ones(1, 418);

for k = 0:417
    for index = 0:k-1      
         power_2_modulo_419_list(k+1) = mod(input * power_2_modulo_419_list(k+1), 419);
    end
end

% disp(power_2_modulo_419_list);

save power_2_modulo_419_list power_2_modulo_419_list

[~, sort_power_2_modulo_419_list_position] = sort(power_2_modulo_419_list);

save sort_power_2_modulo_419_list_position sort_power_2_modulo_419_list_position