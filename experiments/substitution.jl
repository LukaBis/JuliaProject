using SymPy
using SpecialFunctions


y, x, z = symbols("y x z")

expr = x^3 + 4*x*y - z
exprNew = expr.subs([(x, 2), (y, 4), (z, 0)])

println(exprNew)
