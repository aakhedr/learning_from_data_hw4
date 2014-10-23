epsilon = .05;
N = [400000, 420000, 440000, 460000, 480000];
vc = 10;
delta = zeros(length(N), 1);

fprintf('N\tdelta\n');
for i = 1:length(N)
    delta(i) = 4 * (2 * N(i))^vc * exp(-1/8 * epsilon^2 * N(i));
    fprintf('%d\t%f\n', N(i), delta(i));
end