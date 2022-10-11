function [d, allIterations, totalCost, path] = bellmanFord(n,G,E,r)

%% Intialization
N = r;         % Number of Nodes
e = length(E); % Number of Edges

U = E(:,1); % Signal Propagating Nodes
V = E(:,2); % Signal Terminating Nodes
W = E(:,3); % Weights of Edges

d(1:N)=Inf; % distance of each node initialized to infinity 
d(n)=0;     % distance of source node intitalized to 0

predecessor(1:N)=0;

%% Create a set of labels for the node names
for i=1:N
    labels(i) = strcat("Node ",int2str(i));
end

%% Bellman-Ford Algorithm
j=1;
allIterations = zeros(e*(N-1),r);
for k=1:N-1 % For each edge (u,v)...
    for i = 1:e % with weight w in edges do
        allIterations(j,:) = d;
        v = V(i); % v_i in V
        u = U(i); % u_i in U
        w = W(i); % w_i in W

        % Condition for Update (t)
        t = d(u)+w; 

        if (t < d(v))
            d(v) = t;
            predecessor(v) = u; 
        end
        j = j+1;
    end
end

current = r;
path = []; %empty list
while (current ~= 0)
   path(end+1) = (current);
   current = predecessor(current);
end

for i=1:(N-1)
    totalCost = d(r);
    TR=shortestpathtree(G,n,r);
    p=plot(G);
    highlight(p,TR,'EdgeColor','red','LineWidth',5);
end

d = array2table(d,"VariableNames",labels);
allIterations = array2table(allIterations,"VariableNames",labels);

end
