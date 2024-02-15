%exercise number 3.2

%Generate the connectivity matrix of the graph in the exercise 3 

i = [1 1 2 2 3 4 5 6];
j = [2 4 3 4 1 3 6 5];

n = 6;
G = sparse(i,j,1,n,n);
full(G);
U={"https://www.alpha.com"
"https://www.beta.com"
"https://www.gamma.com"
"https://www.delta.com"
"https://www.rho.com"
"https://www.sigma.com"
};

pagerank(U,G,0.85)