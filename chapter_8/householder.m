function [H] = householder(x, k)
% function [H] = householder(x, k)
%
% Inputs:
% x:   vector of length n
% k:   last n-k components of H*x to be zero
%
% Outputs:
% H:   householder array

disp(['Input vector x = [',num2str(x'),']'])
disp(['k = ',num2str(k)])
n = size(x, 1);
s = sqrt(sum(x(k:n).^2));
disp(['s = sqrt(Σx(k:n)^2) = ',num2str(s)])
disp(['s^2 = ', num2str(s^2)])
disp(['sign(x(k)) = ',num2str(sign(x(k)))])
t = sqrt(2*s*(s+abs(x(k))));
disp(['t = sqrt(2*s*(s+abs(x(k)))) = sqrt(',num2str(t^2),') = ',num2str(t)])
u = zeros(n,1);
u(k) = (1/t)*(x(k) + sign(x(k))*s);
disp(['u(',num2str(k),') = (1/t)*(x(k) + sign(x(k))*s) = ',num2str(u(k)), ' = (1/sqrt(',num2str(t^2),')) * ',num2str(x(k) + sign(x(k))*s) ])
for j=k+1:n
    u(j) = (1/t)*x(j);
end
disp(['u = (1/sqrt(',num2str(t^2),')) * [',num2str((u*t)'),'] = [',num2str(u'),']'])
H = eye(n) - 2*u*transpose(u);
disp(['H = I - 2*u*transpose(u) = '])
disp(H)
disp(['Verification: H * x = '])
disp(H * x)

end

