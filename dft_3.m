function y = dft_3(x)

% Winograd dft for length 3

if length(x) ~= 3
    error('the length of the input shall be 3.');
end

N = 3;

x = x(:);

A = [1, 1, 1; ...
    0, 1, 1; ...
    0, 1, -1];

B = diag([1, -3/2, sqrt(3)/2]);

C = [1, 0, 0; ...
    1, 1, -1i; ...
    1, 1, 1i];

y = C * (B * (A * x));

end