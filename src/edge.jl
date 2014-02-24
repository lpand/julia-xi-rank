
module Edge

using Types

const WEIGHT = "_w"
const WEIGHT_TYPE = Float32
const ZERO_WEIGHT = zero(WEIGHT_TYPE)

weight(e::XiEdge) = e.attributes[WEIGHT]

sum_w(acc::WEIGHT_TYPE, e::XiEdge) = acc + weight(e)

w_degree(g::XiNetwork, v::XiVertex) =
    reduce(sum_w, ZERO_WEIGHT, out_edges(v, g))

function w_intersect(g::XiNetwork, v::XiVertex, w::XiVertex)
    v_adj = out_edges(v, g)
    w_adj = out_edges(w, g)
    s::WEIGHT_TYPE = ZERO_WEIGHT
    for ev in v_adj
        for ew in w_adj
            if target(ev) == target(ew)
                s += min(weight(ev), weight(ew))
            end
        end
    end
    s
end

function w_union(g::XiNetwork, v::XiVertex, w::XiVertex)
    vd::WEIGHT_TYPE = w_degree(g, v)
    wd::WEIGHT_TYPE = w_degree(g, v)
    vd + wd - w_intersect(g, v, w)
end

end
