%% Solving the Voltka Loterra Part 1

dt = 0.01;
Tend = 30;
Tspan = 0: dt: Tend;
x0 = [0.9; 1.8];
% options = odeset("AbsTol", 1e-8);
[t, Trajectory] = ode45(@RHS_LotkaVolterra, Tspan, x0);

close all % Close existing things before we make new plot. 

figure(1);
plot(Trajectory(:, 1), Trajectory(:, 2)); 
title("Closed Trajectory");
xlabel("Pray Population"); ylabel("Predator Populations");

figure(2); 
plot(t, Trajectory(:, 1));
hold on
plot(t, Trajectory(:, 2));
title("States of the System"); 
xlabel("time")
legend(["Pray Populuation", "Predator Population"]);


function dydt = RHS_LotkaVolterra(t, states)
    alpha=2/3; 
    beta=4/3; 
    gamma=1;
    delta=1;
    x = states(1); 
    y = states(2);
    dydt = [alpha*x - beta*x*y; delta*x*y - gamma*y];
end