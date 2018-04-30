function [ R ] = run_hw3(p)
%test_hw3 Run tests on given network
    numFlips = [2, 4, 6];
    R = ones(3, size(p,2)-1, 2);
    for maxNum = 2:size(p,2)
        % Will go from 0 to maxNum - 1
        % Hebb rule W: sum of all PnPn'
        WHebb = zeros(30,30);
        for i=1:maxNum
            WHebb = WHebb + p(:,i)*p(:,i)';
        end
        
        WSu = p(:,1:maxNum)*inv(p(:,1:maxNum)'*p(:,1:maxNum))*p(:,1:maxNum)';

        %Test network
        for i = 1:3
            recallHebb = test_hw3( WHebb, p, maxNum, numFlips(i));
            recallSu = test_hw3( WSu, p, maxNum, numFlips(i));
            R(i,maxNum-1, 1) = recallHebb/maxNum*100;
            R(i,maxNum-1, 2) = recallSu/maxNum*100;
        end
    end
end