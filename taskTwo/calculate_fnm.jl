using SymPy
using SpecialFunctions

knm, a, rho, n = symbols("knm a ρ n")

Fnm_expression = diff(bessely(n, knm*a), knm) * besselj(n, knm*rho) - diff(besselj(n, knm*a), knm) * bessely(n, knm*rho)

function calculate_fnm(knm_value, a_value, rho_value, n_value)
    return Fnm_expression.subs([(knm, knm_value), (a, a_value), (rho, rho_value), (n, n_value)]).evalf()
end

### Values for testing purposes

# knm_value = 3
# a_value = 2.2
# rho_value = 1
# n_value = 3
#
# println(calculate_fnm(knm_value, a_value, rho_value, n_value))
