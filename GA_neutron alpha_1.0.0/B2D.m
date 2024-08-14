function D = B2D(B, intLength, fracLength)
% 将二进制数转化为十进制数
% 十进制数 = B2D(二进制数(*矩阵形式), 整数部分长度(*二进制,不包含负数位), 小数部分长度(*二进制))

D = 0;

% 处理符号位
isNegative = B(1) == 1; % 检查符号位是否为1（负数）

% 处理整数部分
for i = 1:intLength
    D = D + B(i + 1) * (2^(intLength - i)); % 符号位占用第1位，所以这里是i+1
end

% 处理小数部分
for i = 1:fracLength
    D = D + B(intLength + i + 1) * (2^(-i)); % 符号位占用第1位，所以这里是i+1
end

% 如果是负数，取负值
if isNegative
    D = -D;
end
end
