function increment(initial, incrementer, times)
    println("\nSimple incrementer:")
    return println(initial + incrementer * times)
end
# Essa função deve incrementar ao número inicial passado por parâmetro o incremento x vezes.

increment(200, 15, 10)
increment(100, 0.25, 100)

# To run Julia file, type: julia> include("path\\to\\file.jl")

function loopIncrementer(initial, increment, times)
    println("\nLoop incrementer for $initial. Adding $increment for $times times:")
    println(initial)
    for i in 1:times
        println(initial + increment * i)
    end
end

loopIncrementer(200, 15, 10)