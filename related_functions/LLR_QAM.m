function [LLR_2, HD1] = LLR_QAM(y_cmp, norm_const,sigm, gray_labels)

q = numel(norm_const); % total number of elements in norm_const array or cell
N = numel(y_cmp); % total number of elements in y_cmp
HD1 = zeros(1,N); % vector of hard decision
LLR_2 = zeros(N,q); % LLR matrix

for i = 1 : N
    % Euclidean distance between the received symbol y_cmp(i) 
    % and each of the possible constellation points in norm_const
    d = abs(y_cmp(i)-norm_const.');

    %finds the minimum distance (dmn) and the index (HD1(i)) of the closest constellation point.
    [dmn,HD1(i)] = min(d);
    
    %converts the index of the closest constellation point into 
    % its corresponding Gray code label using the gray_labels vector, 
    % and stores it in HD1(i)
    HD1(i) = gray_labels(HD1(i));

    %based on the distance between the received symbol and each constellation point
    %minus the distance to the closest constellation point
    %scaled by a factor 2/sigm^2

    LLR_2(i,:) = (d.^2-dmn^2)*2/sigm^2;
end
end


