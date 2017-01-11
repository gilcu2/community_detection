
#keep in each node the intersection of the vicinity of its neighbors
intersectVicinity<-function(neighV) {
  neiV1=sapply(neiV,function(v) {neiV[v]}) # for each vertex, list of neihborhood of its neighbors
  sapply(neiV1,function(v) {Reduce(intersect,v)}) # Intersection of neighborhoods
}

# Find comunity by looking for the edge with less homegeneity and delete it. The comunity are the conected components in the final graph
communityByHomogeneity<-function(g,nComunity=2,order=1,fVicinity=function(neighV) {neighV}) {
  
  # Vicinity of each node
  g1=igraph::delete_vertex_attr(g,"name")  # Remove name attr
  nei=igraph::ego(g1,order)  #neighbors of each vertex
  neiV=sapply(nei,igraph::as_ids) # each neighborhood as normal vector
  neiV1=fVicinity(neiV) # preprocess vicinities
  
  #edges weights
  edges=igraph::as_edgelist(g1)
  edges_weight=apply(edges,1,function(e) {
    length(intersect(neiV[[e[1]]],neiV[[e[2]]]))^2/(length(neiV[[e[1]]])*length(neiV[[e[2]]]))
    })
  
  
}