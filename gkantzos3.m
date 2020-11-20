myHash=0117;

rng(myHash);

%%
%erwthma 2
m=4;
n=20;
    

T=full(sprand(m,m,0.6));
A=arrowNW(T,n);
figure(1)
spy(A)
%%
%erwthma 3
 [L,U]=lu(A);
 
 figure(2)
 spy(L)
 
 figure(3)
 spy(U)  
 
 %%
 %erwthma 4
 
 G=(nnz(L) + nnz(U) -m*n)/nnz(A);
 
 %%
 %erwthma 5
 len=length(A);
 for ll=1:len
     AA(ll,:)=A(len-ll+1,:);
 end
 for ll=1:len
     B(:,ll)=AA(:,len-ll+1);
 end
 
 figure(4)
 spy(B)
 [L,U]=lu(B);
 
 figure(5)
 spy(L)
 
 figure(6)
 spy(U)
 
 G2=(nnz(L) + nnz(U) -m*n)/nnz(B);
 
 %%
 % erwthma 6
 e = ones(m*n,1);
 b = A*e;
for ll=1:len
   b2(ll,:)=b(len-ll+1,:);
      end
 g=@()f1(A,b);
 t1=timeit(g);
 
 g=@()f1(B,b2);
 t2=timeit(g);
 
 
 apotel=zeros(4,4);
 it=0;
 for m=[4,8,16]
     
     if m==4
         it=it+1;
         n=250;
         T=full(sprand(m,m,0.6));
         A=arrowNW(T,n);
            len=length(A);
             for ll=1:len
                AA(ll,:)=A(len-ll+1,:);
             end
            for ll=1:len
                B(:,ll)=AA(:,len-ll+1);
            end
         e = ones(m*n,1);
         b = A*e;
         for ll=1:len
                b2(ll,:)=b(len-ll+1,:);
             end
         
         g=@()g(A,b);
         t1=timeit(g);
 
         g=@()g(B,b2);
         t2=timeit(g);
         apotel(it,:)=[m,n,t1,t2];
     elseif m==16
         it=it+1;
         n=125;
         T=full(sprand(m,m,0.6));
         A=arrowNW(T,n);
         for ll=1:len
                AA(ll,:)=A(len-ll+1,:);
             end
            for ll=1:len
                B(:,ll)=AA(:,len-ll+1);
            end
         e = ones(m*n,1);
         b = A*e;
         for ll=1:len
                b2(ll,:)=b(len-ll+1,:);
             end
         
         g=@()g(A,b);
         t1=timeit(g);
 
         g=@()g(B,b2);
         t2=timeit(g);
         apotel(it,:)=[m,n,t1,t2];
     else
         for n=[125,250]
            it=it+1; 
            T=full(sprand(m,m,0.6));
            A=arrowNW(T,n);
            for ll=1:len
                AA(ll,:)=A(len-ll+1,:);
             end
            for ll=1:len
                B(:,ll)=AA(:,len-ll+1);
            end
         e = ones(m*n,1);
         b = A*e;
         for ll=1:len
                b2(ll,:)=b(len-ll+1,:);
             end
         
            g=@()g(A,b);
            t1=timeit(g);
 
            g=@()g(B,b2);
            t2=timeit(g);
            apotel(it,:)=[m,n,t1,t2];
         end
     end
 end
 
 %%
 %erwthma 7
 
  apotelesmata2=zeros(4,4);
 it=0;
 for m=[4,8,16]
     
     if m==4
         it=it+1;
         n=250;
         T=full(sprand(m,m,0.6));
         A=arrowNW(T,n);
         
         for ll=1:len
                AA(ll,:)=A(len-ll+1,:);
         end
            for ll=1:len
                B(:,ll)=AA(:,len-ll+1);
            end
         A=sparse(A);
         B=sparse(B);
         e = ones(m*n,1);
         b = A*e;
         for ll=1:len
                b2(ll,:)=b(len-ll+1,:);
             end
         
         g=@()g(A,b);
         t1=timeit(g);
 
         g=@()g(B,b2);
         t2=timeit(g);
         apotelesmata2(it,:)=[m,n,t1,t2];
     elseif m==16
         it=it+1;
         n=125;
         T=full(sprand(m,m,0.6));
         A=arrowNW(T,n);
         for ll=1:len
                AA(ll,:)=A(len-ll+1,:);
         end
            for ll=1:len
                B(:,ll)=AA(:,len-ll+1);
            end
         A=sparse(A);
         
         B=sparse(B);
         e = ones(m*n,1);
         b = A*e;
         for ll=1:len
                b2(ll,:)=b(len-ll+1,:);
             end
         
         g=@()g(A,b);
         t1=timeit(g);
 
         g=@()g(B,b2);
         t2=timeit(g);
         apotelesmata2(it,:)=[m,n,t1,t2];
     else
         for n=[125,250]
            it=it+1; 
            T=full(sprand(m,m,0.6));
            A=arrowNW(T,n);
            for ll=1:len
                AA(ll,:)=A(len-ll+1,:);
         end
            for ll=1:len
                B(:,ll)=AA(:,len-ll+1);
            end
            
            A=sparse(A);
            
            B=sparse(B);
            e = ones(m*n,1);
            b = A*e;
            for ll=1:len
                b2(ll,:)=b(len-ll+1,:);
             end
         
            g=@()g(A,b);
            t1=timeit(g);
 
            g=@()g(B,b2);
            t2=timeit(g);
            apotelesmata2(it,:)=[m,n,t1,t2];
         end
     end
 end