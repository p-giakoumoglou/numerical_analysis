function [L,U] = LU_gauss(A)
% function [L,U] = LU_gauss(A)
%
% Inputs:
% A:    array
%
% Outputs:
% L:    Lower triangular array
% U:    Upper triangular array

n = length(A);
L = zeros(n);
U = A;
for j=1:n
    for k=j+1:n
        L(k,j) = U(k,j) / U(j,j);
        for i=j:n
            U(k,i) = U(k,i) - L(k,j)*U(j,i);
        end
    end
    L(j,j) = 1;
end

end

