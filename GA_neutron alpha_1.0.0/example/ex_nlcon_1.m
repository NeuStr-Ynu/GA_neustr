function [c,ceq] = ex_nlcon_1(X)
%EX_NLCON_1 约束条件函数
%   [不等式约束,等式约束] = fmincon(变量)

%% 不等式约束
c1=X(1)+X(2)-6;
c2=3*X(1)-2*X(2)-5;
c3=X(1)-2;
c4=1-X(1);
c5=X(2);
c6=-1-X(2);
c=[c1;c2;c3;c4;c5;c6];
%% 等式约束
ceq=[];
end

