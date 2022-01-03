xData = linspace(0, 2*pi, 100);
yData = 2.5*sin(pi*xData); 


InitialGuess = [3, 3];
Minimizer = fminsearch(@(x) E2Error(x, xData, yData, @TheModel), ... 
            InitialGuess);
disp("Minimizer: ");
disp(Minimizer);

%% Implement 2 Functions for Fitting Models with a MSE error. 

function preds = TheModel(x, params)
    
end

function error = E2Error(x,xdata, ydata, model)
    
end