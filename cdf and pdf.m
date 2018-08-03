%MATLAB Code:

% %Part B
% clc;
% clear all;
% N = 100;
% y = zeros(1,N);
% x = zeros(1,N);
% for i = 1:N
%     y(i) = rand(1);
%     x(i) = acos(1- 2*y(i));
% end
% mean1 = mean(x);
% var1 = var(x);
% F = @(x)- 0.5*cos(x) +0.5;
% figure(1)
% cdfplot(x);
% hold on;
% ezplot(F,[0,pi]);
 
%Part C 
% clc;
% clear all;
% N = 100;
% y = zeros(1,N);
% x = zeros(1,N);
% for i = 1:N
%     y(i) = rand(1);
%     x(i) = acos(1- 2*y(i));
% end
% m = sum(x)/ N;
% total = 0 ;
% for i =1:N 
%     a = x(i) - m;
%     total = total +a^2;
% end
% mse = total / (N-1);
 
%Part D
 
% clc;
% clear all;
% mean_sample = zeros(10,5);
% var_sample = zeros(10,5);
% N = 100;
% y = zeros(1,N);
% x = zeros(1, N);
% for i =1:N
%     y(i) = rand(1);
%     x(i) = acos(1-2*y(i));
% end
% n = 50;
% for i = 1:n
%     sample = zeros(1,N);
%     for j = 1:N
%         boot = randi(100,1);
%         sample(j) = x(boot);
%     end
%     mean_sample(i) = mean(sample);
%     var_sample(i) = var(sample);
% end
 
%Part E
 
% clc;
% clear all;
% mean_sample = zeros();
% var_sample = zeros();
% N = 100;
% y = zeros(1,N);
% x = zeros(1, N);
% for i =1:N
%     y(i) = rand(1);
%     x(i) = acos(1-2*y(i));
% end
% n = 50;
% e = zeros();
% for i = 1:n
%     sample = zeros(1,N);
%     for j = 1:N
%         boot = randi(100,1);
%         sample(j) = x(boot);
%     end
%     mean_sample(i) = mean(sample);
%     var_sample(i) = var(sample);
% end
% for i = 1:n 
%     e(i) = var_sample(i) - ((pi*pi/4) - 2)^2;
% end
% mse_sample = mean(e);

 

       
       
       
       
