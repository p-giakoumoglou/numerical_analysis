% Example:
% max z = 4*x1 + 3*x2
% s.t. x1 <= 8
%      x2 <= 6
%      x1 + 2*x2 <= 15
%      2*x1 + x2 <= 18
%      x1, x2 >= 0

c = [4, 3]
b = [8;6;15;18];
A = [1, 0;
    0, 1;
    1, 2;
    2, 1]
constraints = 4
simplex()
