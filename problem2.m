vc = 50; delta = .05; N = 1:20000;

a = zeros(length(N), 1); b = zeros(length(N), 1); 
c = zeros(length(N), 1); d = zeros(length(N), 1);

for i = 1:length(N)
    a(i) = sqrt(8/ N(i) * log(4 * (2 * N(i))^vc/ delta));
    b(i) = sqrt(2 * log(2 * N(i) * N(i)^vc)/ N(i)) + sqrt(2/ N(i) * ...
        log(1/ delta)) + 1/ N(i);

    % solving for espilon using quadratic equation
    % epsilon = (-b +/- sqrt(-b^2 - 4 * a * c))/ (2 * a)
    % a = N, b = -2, c = -q ----- epsilon cannot be negative
    q = log(6 * (2 * N(i))^vc/ delta);
    c(i) = (2 + sqrt((-2)^2 - 4 * N(i) * -q))/ (2 * N(i));

    % same as in c - solve for epsilon using quadratic equation
    % a = N - 2, b = -2, c = -N * q
%     q = log(4 * N(i)^(2 * vc)/ delta);
%     q = log(4) + log(N(i)^(2 * vc)) - log(delta);
    q = log(4) + N(i) * log(2 * vc) - log(delta);
    d(i) = (2 + sqrt((-2)^2 - 4 * (N(i) - 2) * -N(i) * q))/ ...
        (2 * (N(i) - 2));
end

% plot(N, a, 'bx'); hold on;
% plot(N, b, 'ro'); 
% plot(N, c, 'k-'); 
% plot(N, d, 'c*');
