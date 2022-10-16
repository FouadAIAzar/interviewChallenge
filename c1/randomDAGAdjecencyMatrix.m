function [A,G] = randomDAGAdjecencyMatrix(r, weightedEdges)
% randomDAGAdjecencyMatrix generates a matrix "A" with random permutations 
% of 1's and 0's if there are no weightedEdges, otherwise permutations 
% between [-1,1]

% Some conditions to check before running the function. If the number of
% nodes is <= 1, then the function will break and return an error
if(r <= 1)
    error("You don't need to run a test. There is no path")
end
% If the number is greater than 200, break the function as to save the
% person from dealing with a pc that's gonna crash.
if(r >= 200)
    error("YOU'RE GONNA BREAK YOUR COMPUTER")
end

% Checks the boolean weightedEdges option
if(weightedEdges)
    A = randi([0 1], r); % Generates a random [nxn] matrix of 1's and 0's
    W = -1 + 2.*rand(r); % Creates a random [nxn] with permutations
                         % between [-1,1]
    A = round(A.*W,1);   % Rounds all floats to first place decimal
else
    A = randi([0 1], r);% Generates a random matrix of 1's and 0's
end

% All DAG matrices are nilpotent
A = A - diag(diag(A)); % To discard of auto-cyclic edges 
A = triu(A); % Store only upper traingle values of square matrix 

% A bodged method to fix for mistakes
for i=1:r-1
    if (nnz(A(i,:)) == 0) % If there is a row of zeors, generate a random
                          % number to save in that row.
        random = randi([i+1,r]);
        if(weightedEdges) % Checks if weighted edge option is on
            A(i,random) = 0.1; % I could come up with a better solution
                               % but this will have to do.
        else
            A(i,random) = 1;   % Ditto
        end
    end
end

%% Test for Nilpotentcy
% A DAG Adjacency Matrix is Nilpotent. A property of a Nilpotent Matrix is
% that the det(N+I) = 1, where I is an Identity Matrix.
if(~det(A + eye(r)))
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

