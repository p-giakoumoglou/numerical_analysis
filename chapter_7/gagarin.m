function [upper_bound] = gagarin(A)
% function [v, u2] = power_m(A, u0, error)
%
% Inputs:
% A:           array
%
% Outputs:
% upper_bound: upper bound of eigenvalues

ri = sum(A');
ci = sum(A);
r = max(ri);
c = max(ci);
upper_bound = min(r,c);

disp(['ri(A) = sum of each row = [',num2str(ri),']']);
disp(['ci(A) = sum of each column = [',num2str(ci),']']);
disp(' ');
disp(['r(A) = max of sum of each row = ',num2str(r)]);
disp(['c(A) = max of sum of each column = ',num2str(c)]);
disp(' ');
disp(['Upper bound of eigenvalues = min{r(A),c(A)} = ',num2str(upper_bound)])

end

