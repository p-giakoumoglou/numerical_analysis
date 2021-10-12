function [x] = gauss_seidel(A,b,epsilon,x0)
% function [x] = gauss_seidel(A,b,epsilon)
%
% Inputs:
% A:
% b:
% epsilon:
%
% Outputs:
% x

if nargin == 3
    x0 = ones(length(A),1);
    x1 = zeros(length(A),1);
else
    x1 = x0;
    x0 = Inf * ones(length(A),1);
end
M = tril(A);
N = A - M;

disp('M = (D + L) = '); disp(M);
disp('N = U = '); disp(N);

if norm(inv(M)*N, Inf) >= 1
    warning(['Method will not converge since ||inv(M)*N||inf = ',num2str(norm(inv(M)*N, Inf)),' >= 1'])
else
    disp(['Method will converge since ||inv(M)*N||inf = ',num2str(norm(inv(M)*N, Inf)),' < 1'])
end
n = length(A);
k = 0;

disp(['-inv(M) * N = ']); disp(-inv(M) * N);
disp('inv(M) * b = '); disp(inv(M)*b);
disp(['x(0) = [', num2str(x0'),']']);

while norm(x1-x0) > epsilon
    k = k + 1;
    x0 = x1;
    x1 = -inv(M)*N*x0 + inv(M)*b;
    disp(['x(',num2str(k),') = -inv(M)*N*x(',num2str(k-1),') + inv(M)*b = [', num2str(x1'),']'])
end
x = x1;
disp(sprintf('\niterations = %3.0f',k))


end

