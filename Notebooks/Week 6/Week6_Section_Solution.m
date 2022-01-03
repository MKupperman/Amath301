%% Computing the Second Order Second Differential using Finite Diff. 
dx = 0.25; 
x = -4:dx:4;
y = sin(x);
diff = zeros(size(x)); 
for IdexI = 1:length(x)
    diff(IdexI) = SecondOrderSecondDiffAt(IdexI, y)/(dx^2);
end
figure; 
plot(x, y); hold on; 
plot(x, diff);
plot(x,-sin(x),'--');
legend(["sin", "sin''", "-sin"]);
title("2n order 2n finite difference");

%% Comptuing the Finite difference Error and Plotting it. 
Powers = -4:-1:-19;
StepSizes = 2.^Powers;
Errors = nan(size(StepSizes));
Counter = 1;
for StepSize = StepSizes
   x = 0:StepSize:1; 
   y = sin(3*x);
   dy2dx2 = SecondOrderSecondDiffFor(y, StepSize);
   Errors(Counter) = norm(dy2dx2 + 9*sin(3*x));
   Counter = Counter + 1;
end
close all; 
figure; 
loglog(StepSizes, Errors);
title("Error Bouncing Back");
xlabel("Log of the step size");
ylabel("Log of the error norm");

%% Implements this: 
% A function that accepts an array and compute the 2nd order 2nd
% differential at the data point at the index i. 
function Summation = SecondOrderSecondDiffAt(i, arr)
    if i < 0 || i > length(arr)
       error("Array index out of range.")
    end
    if length(arr) < 4
       error("The array is too small to take 2nd order second diff. ") 
    end
    Summation = 0;
    if i == 1
        Weights = [2, -5, 4, -1];
        for IdexI = 1:4
            Summation = Summation + Weights(IdexI)*arr(IdexI);
        end
    elseif i == length(arr)
        Weights = [2, -5, 4, -1];
        for IdexI = 0:3
            Summation = Summation + Weights(IdexI + 1)*arr(end - IdexI);
        end
    else
        Weights = [1, -2, 1];
        Summation = Weights(1)*arr(i-1) + Weights(2)*arr(i) + Weights(3)*arr(i + 1);
    end
    
end

function diff = SecondOrderSecondDiffFor(y, h)
    diff = zeros(size(y)); 
    for IdexI = 1:length(y)
        diff(IdexI) = SecondOrderSecondDiffAt(IdexI, y)/(h^2);
    end
end

function Result = TrapzoidalRule(arr, h)

end

function TrapzoidalIntegral(fxn, a, b, h)

end

