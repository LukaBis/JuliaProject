using Roots
using SpecialFunctions
using ForwardDiff

# problem je ca ForwardDiff trazi konkretnu vrijednost x-a i za njega izracuna derivaciju,
# meni treba x ostat i onda nac x kao nultocku
# treba mi nesto ca ce nac derivaciju ali ne kao konkrentu vrijednost nego simbolicki
# tu simbolicku derivaciju bi ubacili u izraz i onda dobili nultocku

# 1. nac kako dobit simbolicki prikazanu derivaciju. Forward diff ne, vidi ca je sa SymPy
# SymPy je za simbolicki racun i ako nece to pomoc onda preko onih formula ca san izvukal

n = 2
f(x) = besselj(n, x);
d = ForwardDiff.derivative(f, 1);
println(d)

f(x) = besselj(3, x) - 0.43017147387562193
a = find_zeros(f, -10, 10)
println(a)
