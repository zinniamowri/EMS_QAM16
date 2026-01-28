clear

probabilities = [2.94037155053036e-09	1.18623054705082e-06	7.28845238108496e-12	1.60538847069045e-07	6.47659933817797e-05	0.0261284665693698	1.60538847069045e-07	0.00353610342370404	1.18623054705082e-06	0.000478559558400942	2.94037155053036e-09	6.47659933817797e-05	0.000478559558400942	0.193064705260108	1.18623054705082e-06	0.0261284665693698% Normalize the probabilities (just in case they don't sum to 1)
probabilities = probabilities / sum(probabilities);

% Create the CDF
cdf = cumsum(probabilities);
    r = rand(); % Generate random number between 0 and 1
    symbol = find(cdf >= r, 1) % Find the corresponding symbol index

