function x = pagerank1(U,G,p)

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

%initial pagerank vector
x = e / n;
G = p*G*D;
z = ((1-p)*(c~=0) + (c==0))/n;

% counter number of iteractions
k=0; 
x_k=x;

while norm(x_k - x,1)>=epsilon && k<n
    x=x_k;
    x_k=G*x + e*(z*x);
    x_k=x_k/norm(x_k,2);

    k=k+1;
end
x =x_k/sum(x_k);


shg
bar(x)
title('Page Rank')

% Print URLs in page rank order.

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


