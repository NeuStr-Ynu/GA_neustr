function B = D2B(D, intLength, fracLength)
% 将10进制转化为2进制
% 二进制数(矩阵) = D2B(十进制数, 整数部分长度(*二进制,不包含负数位), 小数部分长度(*二进制))

% 初始化二进制数组
B = zeros(1, intLength + fracLength + 1); % 多一位用于表示符号位

% 处理符号位
isNegative = D < 0; % 检查是否为负数
B(1) = isNegative; % 符号位，1表示负数，0表示正数

% 处理整数部分
integerPart = floor(abs(D)); % 取绝对值
for i = 1:intLength
    remainder = mod(integerPart, 2); 
    B(intLength - i + 2) = remainder; % 符号位占用第1位，所以这里是i+1
    integerPart = floor(integerPart / 2); 
end

% 处理小数部分
fractionalPart = abs(D) - floor(abs(D));
for i = 1:fracLength
    fractionalPart = fractionalPart * 2;
    B(intLength + i + 1) = floor(fractionalPart); % 符号位占用第1位，所以这里是i+1
    fractionalPart = fractionalPart - floor(fractionalPart);
end

% 如果输入为0，特殊处理
if isempty(B)
    B = 0;
end
end

