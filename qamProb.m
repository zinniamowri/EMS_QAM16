% MATLAB Example: Conditional Probability of Received Sample for Each Symbol in 16-QAM

% Parameters
M = 16; % Modulation order (16-QAM)
sigma = 1; % Standard deviation of noise (related to SNR)
s = qammod(0:M-1, M); % 16-QAM constellation points (transmitted symbols)

% Example received sample (this could be noisy in a real case)
r = 0.541524 - 0.147i; % Received sample (complex)

% Compute conditional probability P(r | s_i) for each possible symbol s_i
P_r_given_si = zeros(1, M); % Initialize array to store probabilities

for i = 1:M
    s_i = s(i); % Symbol s_i from the constellation
    P_r_given_si(i) = (1 / (pi * sigma^2)) * exp(-abs(r - s_i)^2 / sigma^2); % Gaussian probability
end

% Display the conditional probabilities for each symbol
disp('Conditional probabilities P(r | s_i):');


P_r_given_si1 =P_r_given_si;
[~,i1]=max(P_r_given_si);
P_r_given_si1(i1)=[];
probabilities = P_r_given_si1 / sum(P_r_given_si1);

cdf = cumsum(probabilities);
r = rand();
symbol = find(cdf >= r, 1)