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
    if n <= 1
        NextTerm = 1;
    end
    PreviousPreviousTerm = 1;
    PreviousTerm = 1;
    for II = 1:(n-1)
        NextTerm = PreviousPreviousTerm + PreviousTerm;
        PreviousPreviousTerm = PreviousTerm;
        PreviousTerm = NextTerm;
    end
    
end

function Seq = FibboSeq(n)
    Seq = zeros(1, n + 1);
    Seq(1:2) = 1;
    for II = 3:length(Seq)
        Seq(II) = Seq(II - 1) + Seq(II - 2);
    end
    
end

function Term = EigenComputeFibboTo(n)
    M = [0 1; 1 1];
    x = [1 ;1];
    [V, D] = eig(M);
    Term = V*(D^n)*(V\x);
    Term = Term(1);
end

function x = JacobiIterate(A, b)
    M = diag(diag(A))\(A - diag(diag(A)));
    r = diag(diag(A))\b;
    x0 = b;
    xpre = x0;
    x = x0;
    Iterations = 0;
    while norm(xpre - x) > 1e-6 || Iterations == 0
       Iterations = Iterations + 1;
       xpre = x;
       x = r - M*xpre;
    end
end

function x = SolveViaSVD(A, b)
    [U, S, V] = svd(A);
    Sinv = diag(1./diag(S));
    x = V*Sinv*(U'*b);
end