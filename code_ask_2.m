function [ keimeno,x,n] = code_ask_2(A,W,H,b)


    E=W*H';
    x=zeros(length(A));
    
    xold=A\b;
    for n=1:1000
        [L,U]=lu(A+E);
        
        xnew=A\(-E*xold+b);
        if abs(xnew-xold)>10^(-6) 
            break
        end
        xold=xnew;
        
    end
    
    if n<1000
        keimeno='kalh sygklish';
        x=xnew;
    else
        keimeno='kakh sygklish';
        x=xnew;
    end
        

end