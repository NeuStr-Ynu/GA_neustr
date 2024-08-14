function [output] = ex_fun_1(X)
%EX_FUN_1 目标函数
%   [输出] = ex_fun_1(决策变量)

output=2+X(1)^2-cos(2*pi*X(1))+X(2)^2-cos(2*pi*X(2));

end

