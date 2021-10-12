function [A] = qr_iter(A,n)
% function [A] = qr_iter(A,n)
%
% Inputs:
% A:     array
% n:     number of iterations to perform
%
% Outputs:
% A:      semi lower triangular array for easier eigenvalues calculation

disp('A = ')
disp(A)
for i=1:n
    disp(['******** Iteration: ',num2str(i), ' ********'])
    [Q,R] = factor_QR_householder(A);
    A = R * Q ;
    
    disp('Performing QR factor to A ...')
    disp('Q = ')
    disp(Q)
    disp('R = ')
    disp(R)
    disp('New A = R * Q => A = ')
    disp(A)
end
end

