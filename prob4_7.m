% plot the function f(x) = sin(pi * x)
x = zeros(10000, 1);
i = 1; j = -1.0;
while i < 10001
    x(i) = j;
    i = i + 1; j = j + .01;
end
f = sin(pi * x);
plot(x, f); axis([-1 1 -1 1]); axis square;
hold on;

% %% The given options to choose from in question 4
% g_a = 0;            % option a
% plot(x, g_a, 'g'); 
% 
% g_b = .79 * x;      % option b
% plot(x, g_b, 'c'); 
% 
% g_c = 1.07 * x;     % option c
% plot(x, g_c, 'k'); 
% 
% g_d = 1.58 * x;     % option d
% plot(x, g_c, 'm'); 
% =========================================================================
%% use linear regression to find the min SSE hypothesis on these two points
a = -1; b = 1; N = 2;
w = zeros(1000, 1);

for i = 1:1000 
    x_train = a + (b - a) .* rand(N, 1);
    w(i) = pinv(x_train' * x_train) * x_train' * sin(pi * x_train);
end
my_g = mean(w) * x;
plot(x, my_g, 'm-');

disp(mean(w));
