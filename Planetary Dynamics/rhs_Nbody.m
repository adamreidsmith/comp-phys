function dpdt = rhs_Nbody(~,p,~,m)
% Set of right-hand sides for the 4 body problem

N = length(p);

x = p(1:4:N-3);
y = p(2:4:N-2);
dpdt = zeros(size(p));

for n = 1:length(x)
    dpdt(4*n-3) = p(4*n-1);
    dpdt(4*n-2) = p(4*n);
    forcex = 0;
    forcey = 0;
    for i = 1:length(x)
        if i==n 
            continue
        end
        normi = norm([x(i)-x(n),y(i)-y(n)]);
        forcex = forcex - m(i)*(x(n)-x(i))/(normi^3);
        forcey = forcey - m(i)*(y(n)-y(i))/(normi^3);
    end 
    dpdt(4*n-1) = forcex;
    dpdt(4*n) = forcey;
end

end