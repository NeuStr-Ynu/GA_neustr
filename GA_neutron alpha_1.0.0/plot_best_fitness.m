function []=plot_best_fitness(best_fitness_values)
% PLOT_BEST_FITNESS 绘制最佳适应度的迭代图
% []=plot_best_fitness(最佳适应度数组)

    generations = 1:length(best_fitness_values);
    plot(generations, best_fitness_values, '-o', 'LineWidth', 2);
    xlabel('Generation');
    ylabel('Best Fitness');
    title('Best Fitness Over Generations');
    grid on;
end
