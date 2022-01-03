%% 
Clear all, close all, clc;
%% LU Decomposition
% The math is in the python jupyter notebook. 
A = rand(3,3);
[L, U, P] = lu(A);
P*A
L*U  % Should be the same as PA = LU, A = P.'*L*U, P.'*L*Ux = b

%% LU Decomposition Part 2 
x = rand(3, 1);
b = A*x;
xSolved = U\(L\(P*b));
xSolved
x

%% The Harmonic Series (Live Demo)
close all;  % clear Everything before plotting it. 
y = zeros(1000, 1);  % zeros(1000) will give you a matrix. 
SeriesSum = 0;
for IdxI = 1:length(y)
    SeriesSum  = SeriesSum + 1/IdxI;
    y(IdxI) = SeriesSum;
end
XAxis = 1:1000;
plot(XAxis, y)
hold on  % tell matlab to not to clear the figure yet. 
plot(XAxis, log(XAxis))  
% plot(XAxis, log(XAxis), "-x")
xlabel("N")
title("Harmonic Series and Euler Constant")
legend("Harmonic Series", "Log")

%% HW1 The Last Problem (Logistic Chaos)
% No live demo let's just take a look together. 
r = [0.8,1.5,2.8,3.2,3.5,3.65];
IdicesAndr = [r; 1:6];
Results = zeros(50, 6);
Results(1, :) = 0.5;           % setting the initial conditions
for IDxR = IdicesAndr
    r = IDxR(1);
    IdxI = IDxR(2);
    for IdxJ = 2:50
       Results(IdxJ, IdxI) = r*Results(IdxJ - 1, IdxI)*(1 - Results(IdxJ - 1, IdxI));
    end
end
Results

%% Iterative Method: Jacobi Iteration Matrix Form
N = 10;
A = rand(N, N) + 10*eye(N);
x = rand(N, 1);
b = A*x;

D = diag(A);
R = A - diag(D);
x = zeros(N, 1);
for O_O = 1:20  % >w<, the O_O is the running index, it's not used in the for loop
    xpre = x;
    x = (1./D).*(b - R*x); % Need to explain the operator here
    % x = diag(D)\(b - R*x); % <-- This is fine too. 
    max(abs(xpre - x))
end

% When dealing with LU, just do L\

%% Experimenting With InScript Function

[Bigger, Smaller] = OrderIt(0, 1)
[Bigger, Smaller] = OrderIt(1, 0)

%% In Script Functions
function [Bigger, Smaller] = OrderIt(Arg1, Arg2)
    if Arg1 >= Arg2
        Bigger = Arg1;  % Must assign all outputs before terminating the function
        Smaller = Arg2;
        return % Ternimates the Function 
    end
    Bigger = Arg2;
    Smaller = Arg1;
  
end
