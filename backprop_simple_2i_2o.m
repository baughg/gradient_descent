a11 = 13.5;
a21 = -2.5;
a12 = 7.9;
a22 = -1.5;
b1 = -1.8;
b2 = 1.6;

A = [a11 a21; a12 a22];
b = [b1; b2];

N = 1000;
lambda = 0.01;


Xt = rand(2,N) - 0.5;
Yt = A*Xt + repmat(b,1,N);

ar = rand(2,2)*100;
br = rand(2,1)*10;


display(ar);
display(br);
cost = 100;

while(cost > 0.001)
    
    Y = ar*Xt + repmat(br,1,N);
    E = Y - Yt;
    cost = sum(sum(E.^2));
    display(cost);
    err = zeros(3,2);
    
    for n = 1:N
        de = [Xt(:,n) ; 1] * E(:,n)';   
        err = err + de;
    end
    
    err = err ./ N;
    
    delta_a = -lambda * err(1:2,1:2)';
    delta_b = -lambda * err(3,:)';
    
    ar = ar + delta_a;
    br = br + delta_b;
end


