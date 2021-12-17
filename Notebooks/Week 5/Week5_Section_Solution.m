%% Subset Indexing 
cols_to_extract = [1,3];                           % Put these integers into a vector
data_matrix = [1,2,3;2,4,6;,3,6,9];                % some simple data
first_and_third = data_matrix(:, cols_to_extract)  % all rows, some cols


%% Sorting with Subset indexing, Vector
x = [1,4,2,3];
[sorted, index] = sort(x);  % get sorted items and reordering vector
new_sorted = x(index);      % can use this to apply the reordering

%% Sorting with Subset indexing, Matrices
x = [1,4,2,3];
y = magic(4);
[sorted, index] = sort(x);  % get sorted items and reordering vector
new_sorted = x(index)       % can use this to apply the reordering
z = y(:, index)             % preserves row order, only reorder columns


%% Example 5: Jacobi's Iteration
% What is the bug here? 
A = [5 2; -1 3];
b = [3; 2];
solution_guess = zeros(2);
for step=2:30
    new_guess = zeros(1,2);
    new_guess(1) = (3 - 2 * solution_guess(2)) / 5;
    new_guess(2) = (2 - (-1) * solution_guess(1)) / 3;
end
A2 = new_guess
A\b

%% Example 6: Jacobi's Iteration
% What is the bug. 
SolutionGuess = zeros(1, 2);
for step = 1:5
    NewGuess = zeros(1, 2);
    NewGuess(1) = (2 - 2*SolutionGuess(2))/5; 
    NewGuess(2) = (2 - (-1)*SolutionGuess(1))/3;
    SolutionGuess = NewGuess
end
A2 = NewGuess


%% Example 8: If Statement, random vector and Las Vegas Algorithm

while 1 
    x = rand(3, 1); 
    if x(1) && x(2) && x(3) > 0.5
        break;
    end
end
x 

%% Singular Values Decomposition and Eigen Decomposition Facts
X = rand(1024, 20);
C = X*X';
C2 = X'*X;

%% 1. columns of U on Svd of X can have the same vectors: 
[U, SingularValues, ~] = svd(X, "econ"); 
U = U(:, 1:5);                              % get the fist 5 only. 
[V, EigenvaluesOfC] = eigs(C, 5);
V = V(:, 1:5)                               % only get the first 5 values. 
% The maximal difference of the entries measured by absolute values of the
% entries. 
disp("The maximal difference of absolute values around all the entires in the matrix is: ");
disp(num2str(max(abs(V) - abs(U), [], "all")));
disp("We can also plot it like: ") 
plot(abs(V(:, 1)), "*"); hold on;
plot(abs(U(:, 1)), "o")
title("The first Column vector of U, and V"); 
legend(["abs of 1st column of V", "abs of 1st column of u"]);
% 2. The square of the first few singular value of X is the same as the eigen values of
% the matrix C1, or C2
%% 2. The square of the singular values of X is the same as the eigen values of C1, C2
MaxDiff = max(SingularValues(1:5).^2 - EigenvaluesOfC(1));
disp("The maximal diffrence between the square of the singularvalues and the eigenvalues is (only the first 5): ")
disp(num2str(MaxDiff))

%% 3. The Eigenvalues of C1 and C2 are the same: 
[V, EigenValuesOfC2] = eigs(C2, 5);
disp("Max Abs Diff between eigen values of C1 and C2 is (only the first 5): ")
MaxDiff2 = max(abs(EigenvaluesOfC(1:5)) - abs(EigenValuesOfC2(1:5)));
disp(num2str(MaxDiff2))




