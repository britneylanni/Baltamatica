%% 案例3.2.4：矩阵的特征值与特征向量计算
% 功能：计算矩阵的特征值、特征向量，验证 Ax = λx
clear; clc;

fprintf('--- 1. 特征值与特征向量的计算 ---\n');

% 定义一个具有实特征值的对称矩阵和一个非对称矩阵
A_sym = [2, 1; 1, 2];      % 对称矩阵，特征值为 1 和 3
B = [1, 2; 2, 1];          % 非对称矩阵（但此例恰好对称）
C = [0, 1; -1, 0];         % 反对称矩阵，特征值为 ±i

% 使用 eig 函数计算特征值和特征向量
[V_A, D_A] = eig(A_sym);
[V_C, D_C] = eig(C);

fprintf('对称矩阵 A_sym = \n'); disp(A_sym);
fprintf('特征值（对角矩阵 D_A）: \n'); disp(D_A);
fprintf('对应的特征向量（按列排列）V_A: \n'); disp(V_A);

fprintf('\n矩阵 C = \n'); disp(C);
fprintf('特征值（对角矩阵 D_C）: \n'); disp(D_C);
fprintf('对应的特征向量 V_C: \n'); disp(V_C);

fprintf('\n--- 2. 验证特征方程 Ax = λx ---\n');
% 取 A_sym 的第一个特征值和特征向量进行验证
lambda1 = D_A(1,1);
v1 = V_A(:,1);

fprintf('验证特征值 λ1 = %.2f 和特征向量 v1:\n', lambda1);
fprintf('A * v1 = \n'); disp(A_sym * v1);
fprintf('λ1 * v1 = \n'); disp(lambda1 * v1);
fprintf('两者相等，验证通过。\n');