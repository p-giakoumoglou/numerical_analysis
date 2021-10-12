% example gagarin
clc;
A = [24 -1 15; 9 -2 5; -1 3 5];
gagarin(A);

% example power_m
clc;
A = [24 -1 15; 9 -2 5; -1 3 5];
u0 = [1;1;1];
error = 1e-5;
[v, u] = power_m(A, u0, error);

% example power_m
clc;
A = [2 1;1 2];
u0 = [2;1];
error = 1e-2;
[v, u] = power_m(A, u0, error);

% example power_iter
clc;
A = [24 -1 15; 9 -2 5; -1 3 5];
error = 1e-5;
e = power_iter(A, error);

% example qr_iter
clc;
A = [6 -1 5; -3 2 -1; 2 4 2];
A = qr_iter(A,6);