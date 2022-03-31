function CosmicDance_3D
% Solves the evolution of an N-body system in two dimension.
% The position (x,y) and velocity (vx, vy) of each body are evolved in time.
% For each body, 4 ODE's are required to describe its evolution.
% We thus need 4*N ODE's for the full system.

t0=0; % initial time (arbitary units)
tn=2; % end time (arbirary units)
h=0.0001; % time step (if using RK4)

N = 3;
m = [10, .1, .1];
p0(1:6) = [0, 0, 0, 0, 0, 0];
p0(7:12) = [.3, 0, 0, 0, 1.7, 0];
p0(13:18) = [0, 0, .3, 0, 0, 0];

% Integrate in time. 
[t,p] = odeRK4sysv('rhs_3D',tn, h, p0, m);

% create a poor man's version of a movie 
clf
n=length(t); 

for j=1:n
    %Plotting in time
    if(mod(j,25) == 1)
%        figure(1)
        hold on
        axis([-1 1 -1 1 -1 1]);
        view(-60,60);
    for i = 1:N
        %plot(p(j,4*i-3),p(j,4*i-2),'ko','Linewidth',8)
        scatter3(p(j,6*i-5), p(j,6*i-4), p(j,6*i-3), 'filled')
    end
    hold off    
    pause(0.001)
    clf
    end
end
end

