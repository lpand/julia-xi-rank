
module Distance


jaccard(g::XiNetwork, v::XiVertex, w::XiVertex) = w_intersect(g, v, w) / w_union(g, v, w)

end
