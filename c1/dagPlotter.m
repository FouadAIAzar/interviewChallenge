function [] = dagPlotter(G, A, weightedEdges)
%
subplot(1,2,1)

if(weightedEdges && length(A)<=10)
    plot(G,'EdgeColor','k','NodeColor','k','EdgeLabel', ...
        G.Edges.Weight,'EdgeLabelColor','red')
else
    plot(G)
 
end
title("DAG")
colormap(gray)

subplot(1,2,2)
heatmap(A)
caxis([-1, 1]);
colormap(gray)
title("Adjacency Matrix")

end

