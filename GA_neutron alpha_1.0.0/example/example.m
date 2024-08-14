clear;
clc;

%% 遗传算法基础参数确定
    pop_size = 50; % 种群大小
    num_generations = 50; % 迭代次数
    crossover_rate = 0.5;% 交叉概率
    mutation_rate = 0.1; % 变异概率
    num_variables = 2; % 变量个数
    M1 = 1000; % 惩罚系数
    tournament_size=5;% 锦标赛大小
    objfun=@(x) ex_fun_1(x);% 目标函数
    nlcon=@(x) ex_nlcon_1(x);% 约束条件
    ub=[2;0];% 上界
    lb=[1,-1];% 下界
%% EX_1
[best_solution_decimal,best_fitness_values]=GA_TS(objfun,nlcon,pop_size,num_generations,crossover_rate,mutation_rate,num_variables,M1,tournament_size,3,10,ub,lb);

%% EX_2
% 重新定义基础参数
    objfun=@(x) ex_fun_2(x);% 目标函数
    nlcon=@(x) ex_nlcon_2(x);% 约束条件
    ub=[10,10];% 上界
    lb=[-10,-10];% 下界
[best_solution_decimal,best_fitness_values]=GA_TS(objfun,nlcon,pop_size,num_generations,crossover_rate,mutation_rate,num_variables,M1,tournament_size,3,10,ub,lb);