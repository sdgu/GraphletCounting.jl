using Test
using GraphletCounting

using LightGraphs


@testset "Count triangles" begin
    expectedDG = SimpleDiGraph(6)
    add_edge!(expectedDG, 2, 1)
    add_edge!(expectedDG, 6, 1)
    add_edge!(expectedDG, 3, 1)
    add_edge!(expectedDG, 3, 4)
    add_edge!(expectedDG, 5, 4)
    sort_by_deg_or!(expectedDG)
    enumerate_wedges(expectedDG)
end
