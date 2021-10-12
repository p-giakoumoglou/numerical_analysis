function [v, u2] = power_m(A, u0, error)
% function [v, u2] = power_m(A, u0, error)
%
% Inputs:
% A:     array
% u0:    initial vector
% error: epsilor/error
%
% Outputs:
% v:      eigenvalue approximation at index where u==1
% u:      eigenvector approximation

u1 = u0;
k = 0;
while 1
    v = A*u1;
    u2 = (1/norm(v,Inf))*v;
    disp(['u(',num2str(k),') = [',num2str(u1'),']'])
    disp(['v(',num2str(k+1),') = A * u(',num2str(k),') = [',num2str(v'),']'])
    disp(['u(',num2str(k+1),') = 1/',num2str(norm(v,Inf)),' * [',num2str(u1'),'] = [',num2str(u2'),']'])
    disp(' ')
    if norm(u2-u1,Inf) < error
        break
    end
    u1 = u2;
    k = k + 1;
end
end