
% Pagerank2.m file
function x = pagerank2(U,G,p,alpha)

if nargin < 3, p = .85; end

%Tollerance value for the loop condition
epsilon=1e-6;

% c = out-degree, r = in-degree
[~,n] = size(G);
c = sum(G,1);
r = sum(G,2);

% Scale column sums to be 1 (or 0 where there are no out links).
k = find(c~=0);
D = sparse(k,k,1./c(k),n,n);
e = ones(n,1);
I = speye(n,n);

x = e/n;
z = ((1-p)*(c~=0) + (c==0))/n;

%number of iteractions
k=0;
A = p*G*D + e*z;
eigenval=0;
x =x/norm(x,1); 

x_k=x;
eigenVal_k=1;

while norm(eigenVal_k - eigenval,1)>= epsilon 
	x=x_k;
	eigenval=eigenVal_k;
	x_k = ( A-alpha*I )\x;
	x_k = x_k/norm(x_k,1);
	eigenVal_k= transpose(x_k)*A*x_k;


	k=k+1;
end
x =x_k/sum(x_k);

% Print URLs in page rank order.
shg
bar(x)
title('Page Rank')


if nargout < 1
   [~,q] = sort(-x);
   disp('     page-rank  in  out  url')
   k = 1;
   maxN = length(U);
   while  (k <= maxN) && (x(q(k)) >= .005)
       disp(k)
      j = q(k);
      temp1  = r(j);
      temp2  = c(j);
      disp(fprintf(' %3.0f %8.4f %4.0f %4.0f  %s', j,x(j),full(temp1),full(temp2),U{j}))
      k = k+1;
   end
end
end