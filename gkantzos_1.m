%erwthma a)


pinakas_apotelesmatwn=zeros(6,3);
i=1;
for n=[128,512]
    
    for t=[1,2,10]
        A=rand(n);
        W = randn(n,t);
        H = randn(n,t);
        Ran=rank((A+W*(H'))^(-1)-A^(-1));
        pinakas_apotelesmatwn(i,:)=[n,t,Ran];
        i=i+1;
    end
    
end

%%
%erwthma b)

pinakas_apotelesmatwn2=zeros(6,3);
i=1;
for n=[128,512]
    
    for t=[1,2,10]
        A = tril(randn(n));
        W = randn(n,t);
        H = randn(n,t);
        Ran=rank((A+W*(H'))^(-1)-A^(-1));
        pinakas_apotelesmatwn2(i,:)=[n,t,Ran];
        i=i+1;
    end
    
end


%%

%erwthma 4-5)

i=0;
pinakas_apotelesmatwn3=zeros(4,2);
for n=[8,16,32,64]
    i=i+1;
    A=rand(n);
    [L,U,arithmos_tonwsewn]=luboost(A);
    t=rank(L*U-A);
    pinakas_apotelesmatwn3(i,:)=[t,arithmos_tonwsewn];
end