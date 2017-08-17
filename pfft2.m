function y = pfft2(x)

% Pease fft algorithm of length 2^t

n = length(x);
t = ceil(log2(n));

xt = bit_reversal(x);
yt = zeros(n, 1);

for c = t:-1:1
    w = exp(-2*pi*1i / 2^(t-c+1));
    
    for r = 0:2^(t-1)-1
        r1 = floor(r/2^(c-1));
        xt(r*2+1+1) = w^r1 * xt(2*r+1+1);
        yt(r+1) = xt(2*r+1) + xt(2*r+1+1);
        yt(r+n/2+1) = xt(2*r+1) - xt(2*r+1+1);
    end
    xt = yt;
end

y = yt;

end