% Group 1
% Brian McIlwian, Justin Guillory, Marshall Simien, Mike Cole, Taj Chauvin 
% Project #1 Perceptron Learning

% (a) Write a program to implement perceptron learning algorithm. 
% Assume there are R inputs and S neurons in the neural network.  
% Verify the learning using data given below.

% This implementation REQUIRES P and T to both be COLUMN vectors of any
% length

P = { [1 4]' [1 5]' [2 4]' [2 5]' [3 1]' [3 2]' [4 1]' [4 2]' };
T = { 0 0 0 0 1 1 1 1 };

% Initialize correct size W and B array
W = zeros([ size(cell2mat(T(1)),1) size(cell2mat(P(1)),1) ]);
B = zeros(size(cell2mat(T(1))));

% Intialize training rate and max epocs
alpha = 1;
maxEpocs = 10000;

% Run Perceptron algorthym
[W, B, epoc, converges] = my_perceptron(P, T, W, B, alpha, maxEpocs);

% Display outputs
if (converges)
    fprintf('Network a converges epoc = %i\n', epoc);
else
    fprintf('Network a does not converge after %i epocs\n', maxEpocs); 
end

disp('Training rate (alpha) ');
disp(alpha);
disp('Final W ');
disp(W);
disp('Final B ');
disp(B);

% (b) Also, verify your algorithm for any multi-neuron classification problem.
P = { [3 5 2]' [3 6 5]' [4 5 3]' [4 6 1]' [6 2 2]' [6 3 3]' [7 2 5]' [7 3 4]'};
T = { [-1 1]'  [1 1]'   [-1 1]'  [-1 1]'  [-1 -1]' [-1 -1]' [-1 -1]' [-1 -1]'};

% Initialize correct size W and B array
W = zeros([ size(cell2mat(T(1)),1) size(cell2mat(P(1)),1) ]);
B = zeros(size(cell2mat(T(1))));

% Intialize training rate and max epocs
alpha = 1;
maxEpocs = 10000;

% Run Perceptron algorthym
[W, B, epoc, converges] = my_perceptron(P, T, W, B, alpha, maxEpocs);

% Display outputs
if (converges)
    fprintf('Network b converges epoc = %i\n', epoc);
else
    fprintf('Network b does not converge after %i epocs\n', maxEpocs); 
end

disp('Training rate (alpha) ');
disp(alpha);
disp('Final W ');
disp(W);
disp('Final B ');
disp(B);


% XOR example - Does not converge
P = { [0 0]' [0 1]' [1 0]' [1 1]'};
T = { 0 1 1 0};

% Initialize correct size W and B array
W = zeros([ size(cell2mat(T(1)),1) size(cell2mat(P(1)),1) ]);
B = zeros(size(cell2mat(T(1))));

% Intialize training rate and max epocs
alpha = 1;
maxEpocs = 10000;

% Run Perceptron algorthym
[W, B, epoc, converges] = my_perceptron(P, T, W, B, alpha, maxEpocs);

% Display outputs
if (converges)
    fprintf('Network XOR converges epoc = %i\n', epoc);
else
    fprintf('Network XOR does not converge after %i epocs\n', maxEpocs); 
end

disp('Training rate (alpha) ');
disp(alpha);
disp('Final W ');
disp(W);
disp('Final B ');
disp(B);