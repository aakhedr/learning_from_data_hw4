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

%% use linear regression to find min SSE hypothesis on random two points
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

%% Question 5 
% bias = g_bar(x) - f(x)
bias = mean((g_bar * X_TRAIN - F_TRAIN).^2);
fprintf('bias: %f\n', bias);
legend('f (target function)', 'g bar', 'location', 'best');

%% Question 6

