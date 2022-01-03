%% 
clc; close all; clear all;

%% Let's Construct the Discrete Sine Matrix.


M = 10; N = 200;

GridPoints     = linspace(0, 2*pi, N);
DiscreteMatrix = zeros(M, N);

for Index = 1:M
    Row = sin(GridPoints*Index/2);
    Row = Row / norm(Row);
    DiscreteMatrix(Index, :) = Row;
end

for Index = 1: M
    plot(GridPoints, DiscreteMatrix(Index, :)); hold on
end

%% Let's Visualize the Matrix
figure; 
imagesc(DiscreteMatrix); colorbar
CorrelationsMatrix = DiscreteMatrix*DiscreteMatrix'; 
figure; 
imagesc(DiscreteMatrix*DiscreteMatrix');
figure; 
imagesc(log10(abs(CorrelationsMatrix))); colorbar; 

%% Let's try out the function we made! 
DSMatrix = DiscreteSineMatrix(10, 200); 


%% Let's Try to use it to approximate some functions! 
M = 10; 
N = 200;
DSMatrix = DiscreteSineMatrix(M, N); 
x = linspace(0, 2*pi, N)';
y = x';

DotProjections = DSMatrix*x;
Recovered = DSMatrix'*DotProjections;

figure;
plot(1:M, DotProjections, "o");

figure;
plot(Recovered);


%% Let's make a function for the matrix 

function Matrix = DiscreteSineMatrix(M, N)
    
    GridPoints     = linspace(0, 2*pi, N);
    DiscreteMatrix = zeros(M, N);

    for Index = 1:M
        Row = sin(GridPoints*Index/2);
        Row = Row / norm(Row);
        DiscreteMatrix(Index, :) = Row;
    end

    Matrix = DiscreteMatrix;
end
