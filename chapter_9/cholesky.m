function [H] = cholesky(A)
% function [H] = cholesky(A)
%
% Inputs:
% A:    array
%
% Outputs:
% H:    H(i,i) > 0 s.t. A = transpose(H) * H

disp('Check 9.40 and 9.41 in p.227')
disp(' ')
n = length(A);
for k=1:n
    disp(['k = ',num2str(k)])
    sum = 0;
    for s=1:k-1
        sum = sum + H(k,s)^2;
    end
    H(k,k) = sqrt(A(k,k) - sum);
    disp(['H(',num2str(k),',',num2str(k),') = ',num2str(H(k,k)), ' = sqrt(',num2str(A(k,k)),' - ',num2str(sum), ')'])
    for i=k+1:n
        sum = 0;
        for s=1:k-1 sum = sum + H(i,s)*H(k,s);
        end
        H(i,k) = 1/H(k,k) * (A(i,k) - sum);
        disp(['H(',num2str(i),',',num2str(k),') = ',num2str(H(i,k)),' = (1/',num2str(H(k,k)),') * (',num2str(A(i,k)),' - ',num2str(sum),')'])
    end
    disp(' ')
end
disp(' ')
disp('H = '); disp(H);
disp(' ')
disp('Indeed transpose(H) * H = '); disp(H*transpose(H));
disp('and A = '); disp(A);

end

