using ForwardDiff
using SpecialFunctions

n = 2
f(x) = besselj(n, x);
d = ForwardDiff.derivative(f, 1);
println(d)
