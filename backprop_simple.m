a = 13.5;
b = -1.8;
N = 1000;
lambda = 0.01;


Xt = rand(1,N) - 0.5;
Yt = Xt*a + b;

ar = rand(1,1)*100;
br = rand(1,1)*10;
err = 100;

while(err > 0.001)
    Y = Xt*ar + br;
    E = Y - Yt;
    err = sum(E.^2);
    display(err);
    da = E.*Xt;
    db = E;
    
    delta_a = -lambda * mean(da);
    delta_b = -lambda * mean(db);
    
    ar = ar + delta_a;
    br = br + delta_b;
end


