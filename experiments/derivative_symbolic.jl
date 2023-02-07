using SymPy
using SpecialFunctions

#n = Sym("n")
#x = Sym("x")
n, x = symbols("n x")
#f(x) = exp(x)*sin(x)
f(x) = besselj(n, x);

expr = diff(f(x), x)
#expr(n=>2, x=>2)
newExpression = expr.subs(n, 2)

#vidi ako primjer sa ovog radi https://docs.juliahub.com/SymPy/KzewI/1.0.29/Tutorial/basic_operations/

println(newExpression)
println(expr)
