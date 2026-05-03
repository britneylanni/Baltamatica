%% 案例3.2.1: 矩阵基本运算与行列式
% 功能: 演示矩阵创建、基本运算
clear; clc; % 清空工作区和命令窗口
fprintf('--- 1. 矩阵创建与基本运算 ---\n');
% 定义两个矩阵A和B
A = [1, 2; 3, 4];
B = [5, 6; 7, 8];
fprintf('矩阵 A = '); disp(A);
fprintf('矩阵 B = '); disp(B);

% 矩阵加法
C_add = A + B;
fprintf('A + B = '); disp(C_add);

% 矩阵减法
C_sub = A - B;
fprintf('A - B = '); disp(C_sub);

% 矩阵乘法
C_mul = A * B; % 注意与点乘 .* 的区别
fprintf('A * B = \n'); disp(C_mul);

% 矩阵转置
A_trans = A';
fprintf('A 的转置 A'' = '); disp(A_trans);

fprintf('--- 2. 行列式计算 ---\n');
% 计算行列式
det_A = det(A);
det_B = det(B);
fprintf('det(A) = %.2f\n', det_A);
fprintf('det(B) = %.2f\n', det_B);