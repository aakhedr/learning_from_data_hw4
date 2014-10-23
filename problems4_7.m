%% plot the function f(x) = sin(pi * x) using 10000 examples
num_examples = 10000;
x = zeros(num_examples, 1);

% construct the x vector
i = 1; j = -1.0;
while i < num_examples + 1
    x(i) = j;
    i = i + 1; j = j + .01;
end
f = sin(pi * x);        % compute the y value for every x
% plot the function f(x) = sin(pi * x)
plot(x, f); axis([-1 1 -1 1]); axis square;
hold on;

%% use linear regression to find min SSE hypothesis on two random points
a = -1; b = 1; N = 2; num_iters = 1000;
g = zeros(num_iters, 1);
X_TRAIN = [];
F_TRAIN = [];

for i = 1:num_iters
    % pick two random training points
    x_train = a + (b - a) .* rand(N, 1);
    % compute corresponding y axis value according to the target function
    % f(x) = sin(pi * x)
    f_train = sin(pi * x_train);
    % use normal equation to get the min SSE hypothesis (g)
    g(i) = pinv(x_train' * x_train) * x_train' * f_train;

    %== Use the following to calcualte the bias and variance ==%
    % combine all x_train points in 1 vector
    X_TRAIN = [X_TRAIN x_train'];
    % combine all f_train points in 1 vector
    F_TRAIN = [F_TRAIN f_train'];
end

%% Question 4
g_bar = mean(g); 
fprintf('g_bar: %f\n', g_bar);
plot(x, g_bar * x, 'r-');
legend('f (target function)', 'g bar', 'location', 'best');

%% Question 5 
% bias = (g_bar(x) - f(x)).^2
bias_5 = mean((g_bar * X_TRAIN - F_TRAIN).^2);
fprintf('bias: %f\n', bias_5);

%% Question 6
% variance = g_each_data_set(x) - g_bar(x)).^2
vars = zeros(length(g), 1);
for i = 1:length(g)
    vars(i) = mean((g(i) * X_TRAIN - g_bar * X_TRAIN).^2);
end
variance_6 = mean(vars);
fprintf('variance: %f\n', variance_6);

%% Question 7
%% Option b
E_out_b = bias_5 + variance_6;

%% Option a
%% use the average of the two x_train points to find min SSE hypothesis 
% on two random points
a = -1; b = 1; N = 2; num_iters = 1000;
g = zeros(num_iters, 1);
X_TRAIN = [];
F_TRAIN = [];

for i = 1:num_iters
    % pick two random training points
    x_train = a + (b - a) .* rand(N, 1);
    % compute corresponding y axis value according to the target function
    % f(x) = sin(pi * x)
    f_train = sin(pi * x_train);
    % use the average to get the min SSE hypothesis (g)
    g(i) = (x_train(1) + x_train(2))/ 2;

    %== Use the following to calcualte the bias and variance ==%
    % combine all x_train points in 1 vector
    X_TRAIN = [X_TRAIN x_train'];
    % combine all f_train points in 1 vector
    F_TRAIN = [F_TRAIN f_train'];
end

g_bar = mean(g);
% bias = (g_bar(x) - f(x)).^2
bias = mean((g_bar * X_TRAIN - F_TRAIN).^2);

% variance = g_each_data_set(x) - g_bar(x)).^2
vars = zeros(length(g), 1);
for i = 1:length(g)
    vars(i) = mean((g(i) * X_TRAIN - g_bar * X_TRAIN).^2);
end
variance = mean(vars);
E_out_a = bias + variance;
fprintf('Optoin(a)\th(x) = b\t%f\n', E_out_a);
fprintf('Optoin(b)\th(x) = ax\t%f\n', E_out_b);

%% Option c
%% use linear regression to find min SSE hypothesis on two random points
a = -1; b = 1; N = 2; num_iters = 1000;
g = zeros(num_iters, 2);    % now two weights incl. the intercept term
X_TRAIN = [];
F_TRAIN = [];

for i = 1:num_iters
    % pick two random training points
    x_train = a + (b - a) .* rand(N, 1);
    % compute corresponding y axis value according to the target function
    % f(x) = sin(pi * x)
    f_train = sin(pi * x_train);

    % first add intercept term to x_train
    x_train = [ones(size(x_train, 1), 1) x_train];

    % use normal equation to get the min SSE hypothesis (g)
    g(i, :) = (pinv(x_train' * x_train) * x_train' * f_train)';

    %== Use the following to calcualte the bias and variance ==%
    % combine all x_train points in 1 vector
    X_TRAIN = [X_TRAIN x_train'];
    % combine all f_train points in 1 vector
    F_TRAIN = [F_TRAIN f_train'];
end

g_bar = mean(g);
% bias = (g_bar(x) - f(x)).^2
bias = mean((g_bar * X_TRAIN - F_TRAIN).^2);

% variance = g_each_data_set(x) - g_bar(x)).^2
vars = zeros(length(g), 1);
for i = 1:length(g)
    vars(i) = mean((g(i, :) * X_TRAIN - g_bar * X_TRAIN).^2);
end
variance = mean(vars);
E_out_c = bias + variance;
fprintf('Optoin(a)\th(x) = ax + b\t%f\n', E_out_c);

