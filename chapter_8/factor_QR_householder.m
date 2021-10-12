function [Q,R] = factor_QR_householder(A)
% function [Q,R] = factor_QR_householder(x, k)
%
% Inputs:
% A:  input matrix
%
% Outputs:
% Q:   Q matrix
% R:   R matrix

[m,n] = size(A);
disp('A = ')
disp(A)
disp('Init: R=A, Q=I')
R = A;
Q = eye(m,m);
for k = 1:m-1
    [H] = householder(R(:,k),k);
    disp('H = ')
    disp(H)
    R = H * R;
    disp('R = H * R => R =')
    disp(R)
    Q = Q * H;
    disp('Q = Q * H => Q =')
    disp(Q)
end
end