


"""
    toDAG

Returns degree oriented DAG
"""
function toDAG(G::SimpleGraph)
    n = nv(G)

    # # SimpleDiGraphs contain both out- and in-degree information
    DG = SimpleDiGraph(n)


    for i in vertices(G) # for each node
        for j in neighbors(G, i) # for each neighbor

            # # if edge has already been seen, skip processing
            if i > j
                continue
            end

            degi = degree(G, i)
            degj = degree(G, j)

            # # conditions for adding a directed edge
            if (degi < degj) || (degi == degj && i < j)
                add_edge!(DG, i, j)
            else
                add_edge!(DG, j, i)
            end
        end
    end


    for i in vertices(DG) # for each node
        # # order its out-neighbor list from lowest degree to highest degree
        sort!(DG.fadjlist[i], lt=(x, y) -> (degree(DG, x) < degree(DG, y)) ||(degree(DG, x) == degree(DG, y) && x < y))
    end

    # println(DG.fadjlist)
    # println(DG.badjlist)

    return DG

end
