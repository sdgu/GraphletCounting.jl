using Test
using GraphletCounting

using LightGraphs


@testset "Degree oriented DAG" begin
    G = SimpleGraph(6)
    add_edge!(G, 1, 2)
    add_edge!(G, 1, 3)
    add_edge!(G, 3, 4)
    add_edge!(G, 4, 5)
    add_edge!(G, 1, 6)
    DG = toDAG(G)

    expectedDG = SimpleDiGraph(6)
    add_edge!(expectedDG, 2, 1)
    add_edge!(expectedDG, 6, 1)
    add_edge!(expectedDG, 3, 1)
    add_edge!(expectedDG, 3, 4)
    add_edge!(expectedDG, 5, 4)

    # # checking adjmats bypasses the sorting of the fadjlist
    @test adjacency_matrix(DG, dir=:out) == adjacency_matrix(expectedDG, dir=:out)
    @test adjacency_matrix(DG, dir=:in) == adjacency_matrix(expectedDG, dir=:in)
end
