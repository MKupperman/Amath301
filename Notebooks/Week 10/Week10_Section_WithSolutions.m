xData = linspace(0, 2*pi, 100);
yData = 2.5*sin(pi*xData); 


InitialGuess = [3, 3];
Minimizer = fminsearch(@(x) E2Error(x, xData, yData, @TheModel), ... 
            InitialGuess);
disp("Minimizer: ");
disp(Minimizer);

%% Implement 2 Functions for Fitting Models with a MSE error. 

function preds = TheModel(x, params)
    preds = params(1) * sin(params(2) .* x);
end

function error = E2Error(x,xdata, ydata, model)
    % Given parameters `x`, some data, and a model, return the l2 error
    n = length(xdata);  % how many points do you have? - 1d only
    % Using your parameters and a model, compute the predictions
    preds = model(xdata, x);  % call the model
    error = sqrt(sum((preds - ydata) .^ 2)./n);  % error calculation
end