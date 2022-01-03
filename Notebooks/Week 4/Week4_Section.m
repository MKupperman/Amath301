%% Excercise 1: Fibbo Term Function
% Implement the function FibboTermAt(n) at the end of the script. Details
% refers to the python jupyter notebook. 
for II = 0: 20
   display(num2str(FibboTermAt(II)));
end

%% Excercise 2: Fibbo Sequence Function
% Implement the function FibboSeq(n) at the end of the script, details
% refers to the python jupyter notebook. for II = 0: 20
for NN = FibboSeq(20)
    display(num2str(NN));
end

%% Exercise 3: Eigencompute Fibbo

for II = 0: 20
   display(num2str(EigenComputeFibboTo(II)));
end

%% Exercise 4: Jacobi-Iterate and SVD solve
N = 10;
b = rand(N, 1);
X = randn(N, N);
X = X + diag(sum(abs(X), 1));
display(JacobiIterate(X, b));
display(SolveViaSVD(X, b));

%% In-script Functions
function NextTerm = FibboTermAt(n)

    
end

function Seq = FibboSeq(n)

end

function Term = EigenComputeFibboTo(n)

end

function x = JacobiIterate(A, b)

end

function x = SolveViaSVD(A, b)

end