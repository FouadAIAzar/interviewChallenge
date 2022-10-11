function [A,G] = generateRandomMatrix(n, weightedEdges)
% generateRandomMatrix generates a matrix "A" with random permutations of
% 1's and 0's.
if(weightedEdges)
    A = randi([0 1], n);% Generates a random matrix of 1's and 0's
    W = -1 + 2.*rand(n);
    A = round(A.*W,1);
else
    A = randi([0 1], n);% Generates a random matrix of 1's and 0's
end
A = A - diag(diag(A)); % To discard of cyclic edges and 
A = tril(A);
A = A';
for i=1:n-1
    if (nnz(A(i,:)) == 0)
        random = randi([i+1,n]);
        if(weightedEdges)
            A(i,random) = 0.1;
        else
            A(i,random) = 1;
        end
    end
end

%% Test for Nilpotentcy
% A DAG Adjacency Matrix is Nilpotent. A property of a Nilpotent Matrix is
% that the det(N+I) = 1, where I is an Identity Matrix.
if(~det(A + eye(n)))
    msg = 'Adjcency Matrix is not Nilpotent, go fix it.';
    error(msg);
end

%% Generate Edge List
[u,v] = size(A);
nextRow = 1;
for i = 1:u
    for j = 1:v
        if(nnz(A(i,j)))
            Edges(nextRow,:) = [i,j,A(i,j)];
            nextRow = nextRow + 1 ;
        end
    end
end
%% Compare results with a reliable matlab package
G = digraph(A);
EdgesII = table2array(G.Edges);
if(~isequal(Edges,EdgesII))
    msg = "Dang man, the edges are all wrong. You might want to fix that.";
    error(msg);
end
end

