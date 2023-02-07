using SymPy
using SpecialFunctions

function calculate_Fnm(knm_value, a_value, rho_value, n_value)
    knm, a, rho, n = symbols("knm a ρ n")
    Fnm_expression = diff(bessely(n, knm*a), knm) * besselj(n, knm*rho) - diff(besselj(n, knm*a), knm) * bessely(n, knm*rho)

    return Fnm_expression.subs([(knm, knm_value), (a, a_value), (rho, rho_value), (n, n_value)]).evalf()
end
