function [ L,U,boostcounter] = luboost(A)
%%
% Boosting LU decomposition
%
% Based on paper Mixed accelerated techniques for solving dense linear systems,A.S.Papadakis,E.Gallopoulos
%
% By: E.Gallopoulos 
% email: stratis@ceid.upatras.gr
%
% INPUT:
%   A: an NxN square matrix
%   tol: 
%             Boosting will be made
%             only if the pivot is under the tol
%             of tol (virtual bad pivot).
% OUTPUT:
%   L: L component of B LU factorization ( B = A + X*Y )
%   U: U component of B LU factorization
%   X: matrix NxZ, Z=boost_counter
%   Y: matrix ZxN, Z=boost_counter
%   boost_counter: the number of boostings
%
%  Copyright (C) 2012 E.Gallopoulos
% 
%  This program is free software; you can redistribute it and/or
%  modify it under the terms of the GNU General Public License
%  as published by the Free Software Foundation; either version 2
%  of the License, or (at your option) any later version.
% 
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
% 


Asave = A;
n=length(A);  
X = []; Y = []; 
L = eye(n); U=zeros(n);

boostcounter=0;

for j=1:n-1
     if (abs(A(j,j)) <= 0.3)      
        boostcounter=boostcounter+1;
        
        Y = [Y;[zeros(1,j-1),eye(1,n-j+1)]];
        X = [X,[zeros(j-1,1);eye(n-j+1,1)]];
       
        
        A(j:n,j:n) = A(j:n,j:n)+X(j:n,boostcounter)*Y(boostcounter,j:n);
    end
    L(j+1:n,j) = A(j+1:n,j)/A(j,j);       
    A(j+1:n,j+1:n) = A(j+1:n,j+1:n)-A(j+1:n,j)/A(j,j)*A(j,j+1:n);
end

U = triu(A);


end
