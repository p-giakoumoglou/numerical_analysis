% Example 1 - LU Gauss (A = L*U)
clc;
A = [2 -1 3 4; 5 -2 1 8; 2 0 -2 1; 1 6 -8 2];
[L,U] = LU_gauss(A)

% Example 2 - LU Gauss when drive=0 (A = L*U)
clc;
A = [2 -1 3 4; 5 -2 1 8; 2 0 -2 1; 1 6 -8 2];
A(1,1) = 0;
A(3,1) = 0;
[L,U,X] = LU_gauss_p(A)
(X*L)*(X*U)
X*A

% Example 3.1 - Jacobi
clc;
A = [5 -1;-1 10];
b = [3;19];
epsilon = 0.0001;
jacobi(A,b,epsilon);

% Example 3.2 - Jacobi (A*x=b => x=...)
clc;
A = [-1 10; 5 -1];
b = [19;3];
epsilon = 0.0001;
jacobi(A,b,epsilon);

% Example 4 - Gauss-Seidel (A*x=b => x=...)
clc;
A = [5 -1;-1 10];
b = [3;19];
epsilon = 0.0001;
gauss_seidel(A,b,epsilon);

% Example 5 - SOR (A*x=b => x=...)
clc;
A = [5 -1;-1 10];
b = [3;19];
epsilon = 0.0001;
SOR(A,b,epsilon);

% Example 6 - Doolitle & Croot (A = L*U)
clc;
A = [2 -1 3 4;5 -2 1 8;2 0 -2 1;1 6 -8 2];
[L,U] = doolittle(A);
[L,U] = croot(A);

% Example 7 - Cholesky (A = transpose(H)*H)
clc;
A = [5 -1 3;-1 2 -2;3 -2 3];
H = cholesky(A);

% Example 8 - Thomas (A = L*U)
clc;
A = [1 -2 0 0;-3 4 1 0;0 -6 2 3; 0 0 -1 4];
[L,U] = doolittle(A);