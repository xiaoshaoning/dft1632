function y = bit_reversal(x)

% bit reversal permutation

n = length(x);
t = floor(log2(n));

y = zeros(n, 1);

for ii = 0:n-1
    jj = bit_rev_ind(t, ii);
    y(jj+1) = x(ii+1);
end

end

function rev_index = bit_rev_ind(t, index)

rev_index = 0;
temp_index = index;

for ii = 0:t-1
    bit = mod(temp_index, 2);
    temp_index = floor(temp_index/2);
    rev_index = rev_index * 2 + bit;
end

end