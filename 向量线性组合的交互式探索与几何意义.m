%% 案例4.1。1：向量线性组合的交互式探索与几何意义
clear; clc; close all;

v1 = [2; 1];
v2 = [1; 3];

fprintf('向量 v1 = [%.1f; %.1f], v2 = [%.1f; %.1f]\n', v1(1), v1(2), v2(1), v2(2));

figure('Name', '线性组合动态演示', 'NumberTitle', 'off');
hold on; grid on; axis equal;
xlabel('x'); ylabel('y');
title('输入系数 c1, c2 查看组合向量');

% 固定绘制基向量
quiver(0, 0, v1(1), v1(2), 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
quiver(0, 0, v2(1), v2(2), 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
text(v1(1), v1(2), 'v1', 'Color', 'r');
text(v2(1), v2(2), 'v2', 'Color', 'b');

% 初始化组合向量对象（绿色）
h_comb = quiver(0, 0, 0, 0, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
h_point = plot(0, 0, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');

% 循环交互
while true
    fprintf('\n请输入线性组合系数 c1 和 c2 (输入 q 退出)\n');
    c1_input = input('c1 = ', 's');
    if strcmpi(c1_input, 'q'); break; end
    c2_input = input('c2 = ', 's');
    if strcmpi(c2_input, 'q'); break; end
    
    c1 = str2double(c1_input);
    c2 = str2double(c2_input);
    if isnan(c1) || isnan(c2)
        fprintf('输入无效，请输入数字。\n');
        continue;
    end
    
    comb = c1 * v1 + c2 * v2;
    % 更新绿色向量和点
    set(h_comb, 'UData', comb(1), 'VData', comb(2));
    set(h_point, 'XData', comb(1), 'YData', comb(2));
    
    title(sprintf('c1=%.2f, c2=%.2f → 组合向量 = (%.2f, %.2f)', c1, c2, comb(1), comb(2)));
end

fprintf('演示结束。\n');