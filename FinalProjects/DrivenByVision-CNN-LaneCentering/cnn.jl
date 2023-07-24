lenet = Flux.@autosize (28, 28, 1, 1) Chain(
    Conv((5, 5), 1=>6, relu),
    MaxPool((2, 2)),
    Conv((5, 5), _=>16, relu),
    MaxPool((2, 2)),
    Flux.flatten,
    Dense(_ => 120, relu),
    Dense(_ => 84, relu), 
    Dense(_ => 10),
)
