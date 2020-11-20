function [x,rel,boost_counter]=slu(A,b,tol)
%%
% Stewart's algorithm based on geboost factorization for solving dense linera systems
%
% Based on paper  Mixed accelerated techniques for solving dense linear systems,A.S.Papadakis,E.Gallopoulos
%
% By: A.S.Papadakis 
% email: papadakis@ceid.upatras.gr
%
% INPUT:
%   A:         NxN square matrix
%   b:         Nx1 right hand vector
%   tol: 
%              Boosting will be made
%              only if the pivot is under the tol 
%              of tol (virtual bad pivot).
% 
% OUTPUT:
%   x_sol: solution of Ax=b
%   rel: relative error Ax_sol-b
%   boost_counter: the number of boostings
%
%  Copyright (C) 2012 A.S.Papadakis
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
n=length(A);

[ L,U,X,Y,boost_counter] = geboost(A,tol);

if(boost_counter~=0)
bb=[b,X];

y=L\bb;
zz=U\y;

z=zz(:,1:1);
c1=zz(:,2:end);

theta=c1*((eye(boost_counter)-Y*c1)\(Y*z));

x=z+theta;

rel=norm(A*x-b);

r=b-A*x;
x_f=x;
counter=0;
while(norm(r)>10^(-13))
	bb=[r,X];

	y=L\bb;
	zz=U\y;

	z=zz(:,1:1);
	c1=zz(:,2:end);

	theta=c1*((eye(boost_counter)-Y*c1)\(Y*z));

	d=z+theta;

	x_f=x_f+d;
	r=b-A*x_f;
	counter=counter+1
	norm(r)
end

else
    y=L\b;
    x=U\y;
    rel=norm(A*x-b);
end
