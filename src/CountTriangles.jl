mutable struct TriangleInfo
    total::Int
    perVertex::Vector{Int}
    perEdge::Vector{Int}
end
function TriangleInfo(total::Int, nnodes::Int, nedges::Int)
    return TriangleInfo(total, zeros(Int, nnodes), zeros(Int, nedges))
end

"""
    enumerate_wedges(G::SimpleDiGraph)

Using the degree oriented DAG, enumerate wedges in order count triangles
"""
function enumerate_wedges(DG::SimpleDiGraph)

    n = nv(DG)
    m = ne(DG)

    outinfo = TriangleInfo(0, n, m)

    # # node i
    for i in vertices(DG)
        # # neighbor of i, j
        for (jind, j) in enumerate(neighbors(DG, i))
            # # neighbor of i that isn't j, i.e., the wedge j-i-k.
            # # every neighbor before the jind^th index has already been considered as an endpoint of the wedge. So, start from the j+1st index of neighbors
            for k in neighbors(DG, i)[jind+1:end]

                # # need to check julia docs more carefully, but should be fast since has_edge uses insorted, which assumes what it's looking through is sorted
                if has_edge(DG, j, k) || has_edge(DG, k, j)
                    outinfo.total += 1

                    outinfo.perVertex[i] += 1
                    outinfo.perVertex[j] += 1
                    outinfo.perVertex[k] += 1

                    println("@@@ figure out edge indexing")
                end
                println("wedge $j $i $k")



            end
        end
    end

end
