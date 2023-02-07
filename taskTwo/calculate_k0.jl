using SymPy
using SpecialFunctions
using LinearAlgebra

function calculate_k0(f_value)
    return 2*pi*f_value*(8.854*10^(-12) * 4*pi*10^(-7))^0.5
end
