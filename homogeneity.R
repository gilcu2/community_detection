
# Find comunity by looking for the edge with less homegeneity and delete it. The comunity are the conected components in the final graph
communityByHomogeneity<-function(g,n) {
  g1=igraph::delete_vertex_attr(g,"name")  # Remove name attr
  nei=igraph::ego(g1,1)  #neighbors of each vertex
  neiV=sapply(nei,igraph::as_ids) # each neighborhood as normal vector
  neiV1=sapply(neiV,function(v) {neiV[v]}) # for each vertex, list of neihborhood of its neighbors
  inter=sapply(neiV1,function(v) {Reduce(intersect,v)})
  
  #neighborhood of each vertice and its neighbors
  
}