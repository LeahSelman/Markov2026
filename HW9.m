%Homework 9
clear;clc;close all;

%% problem 1

alpha = 1;
beta = 1;
L = 20;

time_vec = zeros(1000,1);
for j = 1:1000
    i=0;
    t=0;
    while i<L
        if i==0
            T = exprnd(1/alpha);
            i = i+1;
        else
            T = exprnd(1/(alpha+beta));
            if rand(1) <= alpha/(alpha+beta)
                i = i+1;
            else
                i = i-1;
            end
        end
        t = t+T;
    end
    time_vec(j) = t;
end

fprintf("The simulated mean delivery time is %f\n",mean(time_vec))
fprintf("The theorhetical mean delivery time is %f\n",(L*(L+1))/(2*alpha))
fprintf("The variance of the observed time is %f\n",var(time_vec))

%% problem 4
beta = 1;

m = 1:100;

for i = 1:99
    m_sum = 1:i;
    E_tau(i) = (1/beta)*sum(m_sum.^(-1));
end

tau_det = (1/beta)*log(m);

figure
hold on
plot(1:99,E_tau)
plot(m,tau_det)
legend("E[\tau_m]","\tau_m with exp growth")
xlabel("m")
ylabel("\tau_m")