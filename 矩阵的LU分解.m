%% 案例3.2.3：矩阵的LU分解
% 功能：对矩阵进行LU分解，并演示其在解方程组中的应用
clear; clc;

fprintf('--- 1. 矩阵的LU分解 ---\n');
% 定义一个可进行LU分解的矩阵（所有顺序主子式不为零）
A = [2, 1, 1; 4, 3, 3; 8, 7, 9];

% 使用 lu 函数进行LU分解
% L 是下三角矩阵（主对角线为1），U 是上三角矩阵，P 是置换矩阵（可选）
[L, U, P] = lu(A); % 带部分主元的LU分解，P*A = L*U
% 也可以使用 [L, U] = lu(A)，返回的是 A = L*U，其中L是下三角矩阵的逆

fprintf('矩阵 A = '); disp(A);
fprintf('置换矩阵 P = '); disp(P);
fprintf('下三角矩阵 L = '); disp(L);
fprintf('上三角矩阵 U = '); disp(U);

% 验证分解：P * A 应该等于 L * U
fprintf('验证 P*A = L*U：\n');
fprintf('P * A = '); disp(P*A);
fprintf('L * U = '); disp(L*U);
fprintf('两者相等（在计算精度内），分解正确。\n\n');

fprintf('--- 2. 利用LU分解求解线性方程组 ---\n');
% 求解方程组 A * x = b
b = [1; 2; 3];
fprintf('求解方程组 A*x = b，其中 b = '); disp(b');

% 方法：先解 L * y = P * b （前向代入）
%      再解 U * x = y     （回代）
y = L \ (P * b); % 北太天元会自动识别三角矩阵，使用高效的前向/回代法
x = U \ y;

fprintf('通过LU分解求得的解 x = '); disp(x');

% 使用直接法验证
x_direct = A \ b;
fprintf('使用 A\\b 直接求得的解 x_direct = '); disp(x_direct');
fprintf('两种方法结果一致。\n');