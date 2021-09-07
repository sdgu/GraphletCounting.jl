push!(LOAD_PATH, "../src/")
using GraphletCounting
using Documenter

DocMeta.setdocmeta!(GraphletCounting, :DocTestSetup, :(using GraphletCounting); recursive=true)

makedocs(;
    modules=[GraphletCounting],
    authors="sdgu",
    repo="https://github.com/sdgu/GraphletCounting.jl/blob/{commit}{path}#{line}",
    sitename="GraphletCounting.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://sdgu.github.io/GraphletCounting.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/sdgu/GraphletCounting.jl",
)
