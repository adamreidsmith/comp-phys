function CosmicDance_Nbody
% Solves the evolution of an N-body system in two dimension.
% The position (x,y) and velocity (vx, vy) of each body are evolved in time.
% For each body, 4 ODE's are required to describe its evolution.
% We thus need 4*N ODE's for the full system.

t0 = 0; % initial time (arbitary units)
tn = 5; % end time (arbirary units)
h = 0.0001; % time step (if using RK4)


N = 17;
m = [2, ones(1, N-1)];
p0(1:4) = [0, 0, 0, 0];
v = [1.9 3.1 4.5];
r = [0.2 0.55 0.8 0.8];
for n = 1:4
    p0(4*n+1:4*n+4) = [r(1)*(-1)^n, r(1)*(-1)^ceil(n/2), -v(1)*(-1)^ceil(n/2), v(1)*(-1)^n];
end
for n = 5:8
    p0(4*n+1:4*n+4) = [r(2)*floor((n-5)/2)*(-1)^n, r(2)*(1-floor((n-5)/2))*(-1)^n, -v(2)*(1-floor((n-5)/2))*(-1)^(n-1), -v(2)*floor((n-5)/2)*(-1)^n];
end
for n = 9:16
    p0(4*n+1:4*n+4) = [r(3)*cos((n-8)*pi/4), r(3)*sin((n-8)*pi/4), -v(3)*sin((n-8)*pi/4), v(3)*cos((n-8)*pi/4)];
end


%{
N = 6;
m = [20,20,.1,.1,.1,.1];
p0(1:4) = [-0.08, 0, 0, 8];
p0(5:8) = [0.08, 0, 0, -8];
p0(9:12) = [-0.3, 0, 0, -12];
p0(13:16) = [0.3, 0, 0, 12];
p0(17:20) = [-0.5, 0, 0, 8.7];
p0(21:24) = [0.5, 0, 0, -8.7];
%}

%{
N = 21;
m = [30 ones(1,N-1)];
p0(1:4) = [0 0 0 0];
for n = 1:10
    p0(4*n+1:4*n+4) = [.1*cos((n)*pi/5), .1*sin((n)*pi/5), -22*sin((n)*pi/5), 22*cos((n)*pi/5)];
end
for n = 11:20
    p0(4*n+1:4*n+4) = [.2*cos((n-10)*pi/5), .2*sin((n-10)*pi/5), 7*sin((n-10)*pi/5), -7*cos((n-10)*pi/5)];
end
%}

%{
N = 13;
m = [50, ones(1,N-1)];
p(1:4) = [0,0,0,0];
for n = 1:6
    p0(4*n+1:4*n+4) = [-.8+1.6/5*(n-1)-.1, .7, -3, -5+1*(n-1)];
end
for n = 7:12
    p0(4*n+1:4*n+4) = [-.8+1.6/5*(n-7)+.1, -.7, 3, 1*(n-7)];
end
%}

% Integrate in time. 
[t, p] = odeRK4sysv('rhs_Nbody', tn, h, p0, m);

%{
hold on
axis([-1 1 -1 1])
for i = 1:N
    plot(p(1,4*i-3),p(1,4*i-2),'ko','Linewidth',8)
end
hold off
%}

% create a poor man's version of a movie 
clf
n = length(t); 
for j=1:n
    %Plotting in time
    if(mod(j,40) == 1)
        hold on
        axis([-3 3 -3 3]);
    for i = 1:N
        plot(p(j,4*i-3),p(j,4*i-2),'ko','Linewidth',8)
    end
    hold off    
    pause(0.001)
    clf
    end
end

end

