clc;clear;close all;
%% 1a

Q = [-1,1,0,0; 0,-1,1,0; 0,0,-1,1; 1,0,0,-1];
eig_values = eig(Q)

%% 1d
syms y1(t) y2(t) y3(t) y4(t)

eq1 = diff(y1) == -y1 + (1-y1-y2-y3);
eq2 = diff(y2) == y1 - y2;
eq3 = diff(y3) == y2 - y3;
%eq4 = diff(y4) == y3 - y4;
%eq5 = y4 == 1 - y1 - y2 - y3;

eqs = [eq1;eq2;eq3];

ics = [y1(0)==1/3;y2(0)==2/3;y3(0)==0];

[y1S(t),y2S(t),y3S(t)] = dsolve(eqs,ics);

y1S
y2S
y3S
y4S = 1 - y1S - y2S - y3S
%% 1e

N1 = 100;
N2 = 1000;
N3 = 10000;
N4 = 100000;

%time_in_1 = zeros(N1,1);


for j = 1:N1
    RUnif = rand(1);
    if RUnif < 1/3
        State = 1;
    else
        State = 2;
    end
    
    time = 0;
    i = 1;
    while time <5
        states(i) = State;
        jump = exprnd(1);
        time = time + jump;
    
        if State == 1
            State = 2;
        elseif State ==2
            State = 3;
        elseif State == 3
            State = 4;
        elseif State == 4
            State = 1;
        end

        times(i) = time;
        time_in_1(i) = sum(states==1)/length(states);
        i = i+1;
    end
    
    %time_in_1_mat(:,j) = time_in_1;
    % time_in_2(j) = sum(states==2)/length(states);
    % time_in_3(j) = sum(states==3)/length(states);
    % time_in_4(j) = sum(states==4)/length(states);
end

%time_in_1_avg = mean(time_in_1_mat,1);

t = linspace(0,5,100);
figure
hold on
%plot(t,time_in_1_avg)
plot(times,time_in_1)
plot(t, y1S(t), 'LineWidth', 2)
xlim([0 5])
ylim([0 0.5])
title("Fraction of Time in State 1 - 100 Simulations")

% figure
% hold on
% plot(t, y2S(t))
% plot(t,time_in_2)
% xlim([0 5])
% ylim([0 0.5])
% title("Fraction of Time in State 2 - 100 Simulations")
% 
% figure
% hold on
% plot(t, y3S(t))
% plot(t,time_in_3)
% xlim([0 5])
% ylim([0 0.5])
% title("Fraction of Time in State 3 - 100 Simulations")
% 
% figure
% hold on
% plot(t, y4S(t))
% plot(t,time_in_4)
% xlim([0 5])
% ylim([0 0.5])
% title("Fraction of Time in State 4 - 100 Simulations")


%%


time_in_1 = zeros(N2,1);


for j = 1:N2
    RUnif = rand(1);
    if RUnif < 1/3
        State = 1;
    else
        State = 2;
    end
    
    time = 0;
    i = 1;
    while time <5
        states(i) = State;
        times(i) = time;
    
        jump = exprnd(1);
        time = time + jump;
    
        if State == 1
            State = 2;
        elseif State ==2
            State = 3;
        elseif State == 3
            State = 4;
        elseif State == 4
            State = 1;
        end
        i = i+1;
    end
    
    time_in_1(j) = sum(states==1)/length(states);
    % time_in_2(j) = sum(states==2)/length(states);
    % time_in_3(j) = sum(states==3)/length(states);
    % time_in_4(j) = sum(states==4)/length(states);
end

t = linspace(0,5,1000);
figure
hold on
plot(t,time_in_1)
plot(t, y1S(t), 'LineWidth', 2)
xlim([0 5])
ylim([0 0.5])
title("Fraction of Time in State 1 - 1000 Simulations")





time_in_1 = zeros(N3,1);


for j = 1:N3
    RUnif = rand(1);
    if RUnif < 1/3
        State = 1;
    else
        State = 2;
    end
    
    time = 0;
    i = 1;
    while time <5
        states(i) = State;
        times(i) = time;
    
        jump = exprnd(1);
        time = time + jump;
    
        if State == 1
            State = 2;
        elseif State ==2
            State = 3;
        elseif State == 3
            State = 4;
        elseif State == 4
            State = 1;
        end
        i = i+1;
    end
    
    time_in_1(j) = sum(states==1)/length(states);
    % time_in_2(j) = sum(states==2)/length(states);
    % time_in_3(j) = sum(states==3)/length(states);
    % time_in_4(j) = sum(states==4)/length(states);
end

t = linspace(0,5,10000);
figure
hold on
plot(t,time_in_1)
plot(t, y1S(t), 'LineWidth', 2)
xlim([0 5])
ylim([0 0.5])
title("Fraction of Time in State 1 - 10000 Simulations")