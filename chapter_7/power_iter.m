function e = power_iter(A, error)
% function [v, u2] = power_m(A, u0, error)
%
% Inputs:
% A:     array
% error: epsilor/error
%
% Outputs:
% e:      eigenvalues approximation of A from Iterative Power

n = length(A);
for i=1:n-1
    u0 = ones(size(A,1),1);
    [v, u] = power_m(A, u0, error);
    k = find(floor(abs(u)) == 1);
    disp(['Find index where u==1 => index = ',num2str(k)])
    e(i) = v(k);
    disp(['Eigenvalue calculated: ',num2str(e(i))])
    disp(['Performing Householder ...'])
    H = householder(u,1);
    disp('H = ');
    disp(H)
    A = H * A * inv(H);
    disp('New A = H * A * inv(H)')
    disp(A)
    A = A(2:n,2:n);
    disp('where A1 = ')
    disp(A)
    n = length(A);
end
e(length(e)+1) = A;
end