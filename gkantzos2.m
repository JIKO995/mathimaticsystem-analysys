sygkrish_apotelesmatwn=zeros(9,5);
    i=1;
    
for h=2:4
    for n=[10,100,1000]
        A=toeplitz ([h,-1,zeros(1,n-2)]);
        W=randn(n,1);
        W = W/norm(W);
        H = W(n:-1:1);
        b=randi(15,[n 1]);
        tic;
        [keimeno,x,nn] = code_ask_2(A,W,H,b);
        t=toc;
        flag=strcmp(keimeno,'kalh sygklish');
        sygkrish_apotelesmatwn(i,:)=[h,n,flag,t,nn];
        i=i+1;
    end
end