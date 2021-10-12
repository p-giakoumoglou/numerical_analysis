
% Example 1
clc
A = [1 2 -4;5 11 -21;3 -2 3] ;
b = [-4;-22;11];
disp('A = '); disp(A);
disp('b = '); disp(b);
[x,err]=gauss_jordan_elim(A,b);
disp('x = '); disp(x);

% Example 2
clc
A = [1 2 3 1; 1 -3 1 2;2 1 -3 5];
b = [0;0;0];
disp('A = '); disp(A);
disp('b = '); disp(b);
[x,err]=gauss_jordan_elim(A,b);
disp('x = '); disp(x);