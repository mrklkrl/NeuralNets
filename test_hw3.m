function [ successRecalls, a ] = test_hw3( W, p, maxNum, numFlips )
%test_hw3 Run tests on given network
    % initilize num
    successRecalls = 0;
    for k=1:10
        % Add random noise
        Test = p(:, :);
        for i=1:maxNum
            for j=1:numFlips
                % Get random index
                r = randperm(30);
                r = r(1);
                % Flip the bit
                Test(r, i) = Test(r, i)*-1;
            end
        end

        for i=1:maxNum
            a = my_hardlims(W*Test(:,i));
            
            if (~any(a-p(:,i) ~= 0))
                successRecalls = successRecalls + 1;
            end
        end
    end
    successRecalls = successRecalls / 10;
end