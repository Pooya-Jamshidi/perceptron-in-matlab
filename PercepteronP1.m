clear all;
clc;

trains = [
    1,1,-1,-1,1;
    1,-1,1,-1,1;
    -1,-1,1,1,1;
    1,1,1,1,1
    ];

targets = [
    -1,-1,1;
    1,-1,1;
    1,1,-1;
    1,1,1;
    ];

w = zeros(5,3);
flag = ones(1,5);
alpha = 1;
epoch = 1;
i = 1;

while any(flag)
    if i == 5
        i = 1;
        epoch = epoch + 1;
    end
    temp = trains(i,[1:5]) * w;
    temp = (temp > 0) - (temp <= 0);
    if all(temp == targets(i,[1:3]))
        flag(i) = 0;
        flag(5) = 0;
    else
        flag(i) = 1;
        flag(5) = 1;
        temp = trains(i,[1:5]);
        w = w + (temp' * targets(i, [1:3])).*alpha;
    end
    
    i = i + 1;
end


% while true
%     inp = input('Please enter a row : ');
%     if size(inp, 2) ~= 5
%         disp('invalid !');
%         continue;
%     end
%     inp = inp * w;
%     inp = (inp > 0) - (inp <= 0)
%     entery = input('Do you want to continue : [Please enter "0" for end and any to continue]');
%     if entery == 0
%         break;
%     end
% end
inp = [1,1,-1,-1,1];
inp = inp * w;
inp = (inp > 0) - (inp <= 0)
