%% Subset Indexing 
cols_to_extract = [1,3];  % Put these integers into a vector
data_matrix = [1,2,3;2,4,6;,3,6,9];  % some simple data
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
