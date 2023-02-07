using Roots
using SpecialFunctions

# f(x) = x - 5;
# a = find_zeros(f)
# println(a)

#println(besselj(3, 4))

f(x) = besselj(3, x) - 0.43017147387562193
a = find_zeros(f, -10, 10)
println(a)

# ako se u domeni ne nalazi nultocka onda vrati Float64[]
# dal ima fja koja nalazi nultocke bez da definiran interval
