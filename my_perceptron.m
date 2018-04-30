function [ W, B, epoc, converges ] = my_perceptron( P, T, W, B, alpha, maxEpocs )
%MY_PERCEPTRON An implementation of the Perceptron Learning Algorthym
% Inputs:
%   P: Sample inputs (cell list), MUST be column vector
%   T: Targets to sample inputs P (cell list), MUST be column vector
%   W: Initial weight matrix (vector)
%   B: Initial bias matrix (vector)
%   alpha: Training rate (0 < alpha <= 1)
%   maxEpocs: Maximum number of epocs to attempt the algorythym
% Outputs:
%   W: Final weight matrix (vector)
%   B: Finial bias matrix (vector)
%   epoc: Number of epocs run (integer)
%   converges: Did the network converge? (bit)

    % Does not yet converge
    converges = 0;
    
    % Auto detect if -1 / 1 or 0 / 1 is input
    % If 0/1 use hardlim function
    % If -1/1 use hardlims function
    use_hardlims = 0;
    for j=1:size(T,2)
        Tj = cell2mat(T(j));
        use_hardlims = any(Tj(:) == -1);
        
        if (use_hardlims)
            break;
        end
    end
    
    for epoc=1:maxEpocs
        % iterate over full target cell array
        haserr = 0;
        for j=1:size(T,2)
            % Get initial input to hardlim
            mult = W' .* cell2mat(P(j));
            n = B + sum(mult,1)';
            
            % Run hardlim and get claimed output
            if (use_hardlims)
                a = my_hardlims(n);
            else
                a = my_hardlim(n);
            end
            
            % Check error of our output compared to target output
            err = cell2mat(T(j)) - a;
            
            % Is some error in the current output
            % OR has error prevously occured in this epoc?
            haserr = haserr || any(err(:));
            
            % Update weights and bias according to Perceptron algorthym
            W = W + alpha * err .* cell2mat(P(j))';
            B = B + alpha * err;
        end

        % if epoc was perfect, terminate loop
        if (~haserr)
           converges = 1;
           break; 
        end
    end
end