% example householder
clc;
x = [7;4;3];
H = householder(x,2);

% example householder
clc;
x = [7;4;3];
H = householder(x,1);

% example factor_QR_householder
clc;
A = [10 9 18; 20 -15 -15; 20 -12 51];
[Q,R] = factor_QR_householder(A);

% example factor_QR_householder
clc;
A = [3 0; 4 5; 0 4];
[Q,R] = factor_QR_householder(A);