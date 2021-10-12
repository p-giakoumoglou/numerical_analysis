function [L,U] = doolittle(A)
% function [L,U] = doolittle(A)
%
% Inputs:
% A:    array
%
% Outputs:
% L:    Lower triangular array
% U:    Upper triangular array

disp('Check 9.34 and 9.35 in p.222')
n = length(A);
U = zeros(n);
L = eye(n);
for k=1:n
    for j=k:n
        sum = 0;
        for s=1:k-1
            sum = sum + L(k,s)*U(s,j);
        end
        U(k,j) = A(k,j) - sum;
        disp(['U(',num2str(k),',',num2str(j),') = ',num2str(U(k,j)), ' = ',num2str(A(k,j)), ' - ',num2str(sum)]);
    end
    for i=k+1:n
        sum = 0;
        for s=1:k-1
            sum = sum + L(i,s)*U(s,k);
        end
        L(i,k) = (1/U(k,k)) * (A(i,k) - sum);
        disp(['L(',num2str(i),',',num2str(k),') = ',num2str(L(i,k)),' = (1/',num2str(U(k,k)),') * (',num2str(A(i,k)),' - ',num2str(sum),')']);
    end
end
disp(' ')
disp('L = '); disp(L);
disp('U = '); disp(U);

end

