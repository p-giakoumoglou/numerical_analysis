function [L,U,X] = LU_gauss_p(A)
% function [L,U,X] = LU_gauss_p(A)
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
for i=1:n
    p(i) = i;
end
for j=1:n
    max = 0;
    for k=j:n
        if abs(U(p(k),j)) > max
            max = abs(U(p(k),j));
            i = k;
        end
    end
    temp = p(j);
    p(j) = p(i);
    p(i) = temp;
    L(p(j),j) = 1;
    for k=j+1:n
        L(p(k),j) = U(p(k),j) / U(p(j),j);
        for i=j:n
            U(p(k),i) = U(p(k),i) - L(p(k),j)*U(p(j),i);
        end
    end
end
X = zeros(n);
for i=1:n
    for j=1:n
        if p(i) == j
            X(i,j) = 1;
        end
    end
end

end

