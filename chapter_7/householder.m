function [H] = householder(x, k)
n = size(x, 1);
s = sqrt(sum(x(k:n).^2));
t = sqrt(2*s*(s+abs(x(k))));
u = zeros(n,1);
u(k) = (1/t)*(x(k) + sign(x(k))*s);
for j=k+1:n
    u(j) = (1/t)*x(j);
end
H = eye(n) - 2*u*transpose(u);
end

