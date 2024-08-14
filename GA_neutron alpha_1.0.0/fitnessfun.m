function [Fitvalua, cumsump, max_fitness, best_solution] = fitnessfun(population, objfun, nlcon, M1, num)
% FITNESSFUN 计算适应度函数
%   [适应度, 概率区间, 最大适应度, 最佳解] = fitnessfun(种群, 目标函数(@x), 约束条件(@x), 惩罚系数, 变量个数)
%% 全局变量
global intLength; % 整数部分的二进制位数
global fracLength; % 小数部分二进制位数

%% 计算适应度
Length = length(population(1,:))/num;
popsize = size(population,1);
Fitvalua = zeros(popsize, 1);
x_10 = zeros(1, num);
temp_binary = zeros(1, Length);
for i = 1:popsize
    for j = 1:num
        for k = 1:Length
            temp_binary(k) = population(i, (j-1)*Length + k);
        end
        x_10(j) = B2D(temp_binary, intLength, fracLength);
    end
    [c, ceq] = nlcon(x_10);
    if (isempty(c) || all(c <= 0)) && (isempty(ceq) || all(ceq == 0))
        Fitvalua(i) = -objfun(x_10);
    else
        Fitvalua(i) = -objfun(x_10) - M1;
    end
end

Fitvalua = Fitvalua'; 
Pperpopulation = -Fitvalua / sum(Fitvalua);
cumsump = cumsum(Pperpopulation);

% 计算最大适应度值和对应的决策变量
[max_fitness, max_index] = max(Fitvalua);
best_solution_binary = population(max_index, :);

% 将最佳解的二进制形式转换为十进制形式
best_solution = zeros(1, num);
for j = 1:num
    for k = 1:Length
        temp_binary(k) = best_solution_binary((j-1)*Length + k);
    end
    best_solution(j) = B2D(temp_binary, intLength, fracLength);
end

end
