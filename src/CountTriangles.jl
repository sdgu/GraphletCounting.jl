struct TriangleInfo
    total::Int
    perVertex::Vector{Int}
    perEdge::Vector{Int}
end
function TriangleInfo(total, nnodes, nedges)
    return TriangleInfo(total, zeros(Int, nnodes), zeros(Int, nedges))
end


function wedge_enumerator(G::SimpleGraph)

    n = nv(G)
    m = ne(G)

    outinfo = TriangleInfo(0, n, m)

end
