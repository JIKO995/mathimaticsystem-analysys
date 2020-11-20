function [ A ] = arrowNW( T,n )

    B=eye(n,n);
    m=length(T);
    I=eye(m);
    D=T+m*I;
    A=kron(B,D);
    Col=zeros(m,m);
    for i=2:n
        Col=[Col,T];
    end
    Col=[Col;zeros(m*n-m,m*n)];
    
    A=A+Col+Col';
    


end