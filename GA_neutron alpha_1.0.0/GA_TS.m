function [best_solution_decimal,best_fitness_values] = GA_TS( ...
    objfun, ...                 % 目标函数
    nlcon,...                   % 约束条件
    pop_size, ...               % 种群大小
    num_generations, ...        % 迭代次数
    crossover_rate, ...         % 交叉概率
    mutation_rate, ...          % 变异概率
    num_variables, ...          % 变量个数
    M1, ...                     % 惩罚系数
    tournament_size, ...        % 锦标赛大小
    int, ...                    % 整数部分的二进制位数
    frac,...                    % 小数部分二进制位数
    ub, ...                     % 上界
    lb)                        % 下届(*若没有上下界则使用足够大的数)
% GA_TS 使用锦标赛的方式进行遗传算法
% ——————————————————适者生存——————————————————
% [最好解决方案,最佳适应度函数] = GA_TS( ... )


%% 声明全局变量
global intLength; % 整数部分的二进制位数
global fracLength; % 小数部分二进制位数

intLength=int;% 整数部分的二进制位数
fracLength=frac;% 小数部分二进制位数

%% 适者生存

    % 初始化种群
    population = initialize(pop_size, num_variables, lb, ub);
    best_fitness_values = zeros(1, num_generations); 
    best_solutions_decimal = zeros(num_generations, num_variables); 

    for generation = 1:num_generations
        % 计算适应度
        [fitness, ~, max_fitness, best_solution_decimal] = fitnessfun(population, objfun, nlcon, M1, num_variables);
    
        % 选择
        new_population = selection_TS(population, fitness, tournament_size);
    
        % 交叉
        new_population = crossover(new_population, crossover_rate);
    
        % 变异
        new_population = mutation(new_population, mutation_rate);
    
        % 更新种群
        population = new_population;
    
        % 输出当前代的最佳适应度和对应的十进制决策变量
        best_fitness_values(generation) = max_fitness; 
        best_solutions_decimal(generation, :) = best_solution_decimal; %记录
        disp(['迭代次数 ', num2str(generation), ': 最佳适应度 = ', num2str(max_fitness)]);
        disp(['最佳解决方案 = ', num2str(best_solution_decimal)]);
    end
    
%% 绘制最佳适应度的迭代图
    plot_best_fitness(best_fitness_values);

end

