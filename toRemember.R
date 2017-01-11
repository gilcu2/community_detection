# To remember

# Set as label edge_betweenness
g1=set_edge_attr(g,"label",value=edge_betweenness(g,directed=F))

# example graph
g2=graph_from_literal(a-b-c-d-e-f, a-g-h-b, h-e:f:i, j)
