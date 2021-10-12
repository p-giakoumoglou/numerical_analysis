function [Q,R] = factor_QR_householder(A)
[m,n] = size(A);
R = A;
Q = eye(m,m);
for k = 1:m-1
    [H] = householder(R(:,k),k);
    R = H * R;
    Q = Q * H;
end
end