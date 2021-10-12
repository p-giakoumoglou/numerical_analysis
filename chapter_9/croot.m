function [L,U] = croot(A)
% function [L,U] = croot(A)
%
% Inputs:
% A:    array
%
% Outputs:
% L:    Lower triangular array
% U:    Upper triangular array

disp('Check 9.36 and 9.37 in p.223')
n = length(A);
U = eye(n);
L = zeros(n);
for k=1:n
    for i=k:n
        sum = 0;
        for s=1:k-1
            sum = sum + L(i,s)*U(s,k);
        end
        L(i,k) = A(i,k) - sum;
        disp(['L(',num2str(i),',',num2str(k),') = ',num2str(L(i,k)), ' = ',num2str(A(i,k)),' + ',num2str(sum)]);
    end
    for j=k+1:n
        sum = 0;
        for s=1:k-1
            sum = sum + L(k,s)*U(s,j);
        end
        U(k,j) = (1/L(k,k)) * (A(k,j) - sum);
        disp(['U(',num2str(k),',',num2str(j),') = ',num2str(U(k,j)),' = (1/',num2str(L(k,k)),') * (',num2str(A(k,j)),' - ',num2str(sum),')']);
    end
end
disp(' ')
disp('L = ')
disp(L)
disp('U = ')
disp(U)

end

