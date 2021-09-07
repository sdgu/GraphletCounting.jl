


"""
    toDAG

Returns degree oriented DAG
"""
function toDAG(G::SimpleGraph)
    n = nv(G)

    # # unlike the C++ implementation of EVOKE, SimpleDiGraphs contain both in- and out-edge information
    # # so, only one is needed
    DG = SimpleDiGraph(n)

    for i in vertices(G)
        for j in neighbors(G, i)

            # # edge has already been seen
            if i > j
                continue
            end

            degi = degree(G, i)
            degj = degree(G, j)
            if (degi < degj) || (degi == degj && i < j)
                add_edge!(DG, i, j)
            else
                add_edge!(DG, j, i)
            end
        end
    end

    for i in vertices(DG)
        sort!(DG.fadjlist[i], lt=(x, y) -> (degree(DG, x) < degree(DG, y)) ||(degree(DG, x) == degree(DG, y) && x < y))
    end

    # println(DG.fadjlist)
    # println(DG.badjlist)

    return DG

end
