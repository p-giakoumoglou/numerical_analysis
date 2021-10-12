function [x] = SOR(A,b,epsilon,omega,x0)
% function [x] = SOR(A,b,omega,epsilon)
%
% Inputs:
% A:
% b:
% omega:
% epsilon:
%
% Outputs:
% x

if nargin == 3
    x0 = ones(length(A),1);
    x1 = zeros(length(A),1);
    omega = -1;
elseif nargin == 4
    x0 = ones(length(A),1);
    x1 = zeros(length(A),1);
else
    x1 = x0;
    x0 = Inf * ones(length(A),1);
end

n = length(A);
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;
J = -inv(D)*(L + U);

disp('L = '); disp(L);
disp('U = '); disp(U);
disp('D = '); disp(D);
disp('J = -inv(D)*(L + U) = '); disp(J);

if omega == -1
    if (sum(imag(eig(J))) == 0) && (max(abs(eig(J))) < 1) && (max(abs(eig(J))) > 0)
        omega = 2 / (1+sqrt(1-max(abs(eig(J)))^2));
        disp(['Eigenvalues of J are real: [',num2str(eig(J)'),'] and 0< max(abs(eig(J)))=rho(J) < 1'])
        disp(['Setting omega to ',num2str(omega)])
    end
end

M = D + omega*L;
N = (1-omega)*D - omega*U;
T = inv(eye(n) + omega*inv(D)*L) * ((1-omega)*eye(n) - omega*inv(D)*U);

disp('M = D + omega * L = '); disp(M);
disp('N = (1 - omega) * D - omega * U = '); disp(N);
disp('T = inv(I + omega*inv(D)*L) * ((1-omega)*I - omega*inv(D)*U) = '); disp(T)

rho = max(abs(eig(J)));
if rho >= 1
    disp(['Method will not converge since max(abs(eigenvalue(T) = ',num2str(rho),' >= 1']);
    return
else
    disp(['Method will converge since max(abs(eigenvalue(T) = ',num2str(rho),' < 1']);
end

k = 0;

disp(['x(0) = [', num2str(x0'),']'])

while norm(x1-x0) > epsilon
    k = k + 1;
    x0 = x1;
    x1 = inv(M)*N*x0 + inv(M)*omega*b;
    disp(['x(',num2str(k),') = -inv(M)*N*x(',num2str(k-1),') + inv(M)*b = [', num2str(x1'),']'])
end
x = x1;
disp(sprintf('\niterations = %3.0f',k))

end

