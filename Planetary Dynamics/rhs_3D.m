function dpdt = rhs_3D(~,p,~,m)
% Set of right-hand sides for three dimensional orbital system.

N = length(p);

x = p(1:6:N-5);
y = p(2:6:N-4);
z = p(2:6:N-3);
dpdt = zeros(size(p));

for n = 1:length(x)
    dpdt(6*n-5) = p(6*n-2);
    dpdt(6*n-4) = p(6*n-1);
    dpdt(6*n-3) = p(6*n);
    forcex = 0;
    forcey = 0;
    forcez = 0;
    for i = 1:length(x)
        if i==n 
            continue
        end
        normi3 = (norm([x(i)-x(n),y(i)-y(n),z(i)-z(n)]))^3;
        forcex = forcex - m(i)*(x(n)-x(i))/(normi3);
        forcey = forcey - m(i)*(y(n)-y(i))/(normi3);
        forcez = forcez - m(i)*(z(n)-z(i))/(normi3);
    end 
    dpdt(6*n-2) = forcex;
    dpdt(6*n-1) = forcey;
    dpdt(6*n) = forcez;
end
end