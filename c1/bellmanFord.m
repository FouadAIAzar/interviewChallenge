function [d, allIterations, totalCost, path] = bellmanFord(n,G,E,r)
%% The function takes the 
%% Intialization
N = r;         % Number of Nodes
e = length(E(:,3)); % Number of Edges

U = E(:,1);    % Signal Propagating Nodes
V = E(:,2);    % Signal Terminating Nodes
W = E(:,3);    % Weights of Edges

d(1:N)=Inf;    % distance of each node initialized to infinity 
d(n)=0;        % distance of source node intitalized to 0

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

        % t := variable for condition update
        t = d(u)+w; 
        
        if (t < d(v)) % if 
            d(v) = t;
            predecessor(v) = u; 
        end
        j = j+1;
    end
end

%% Trace Path

current = r; % Starting from r and back
path = []; % Create empty list to create array of nodes
while (current ~= 0)
   path(end+1) = current;
   current = predecessor(current);
end

totalCost = d(r); % Self-explanatory

%% Plotting 
% Kinda cheating here. The properties of the digraph G simplifies the
% plotting process for graphs, so I took advantage the shortestpathtree
% property. However, if you're thinking that are any shinanigans, 
% you can refer and compare the results of TR with the "path" variable.

for i=1:(N-1)
    TR=shortestpathtree(G,n,r);
    p=plot(G);
    highlight(p,TR,'EdgeColor','red','LineWidth',5);
    title("Shortest Path")
end
%% Convert results to table for your viewing pleasure
d = array2table(d,"VariableNames",labels);
allIterations = array2table(allIterations,"VariableNames",labels);

end
