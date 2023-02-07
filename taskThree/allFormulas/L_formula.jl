using SymPy
using SpecialFunctions

# this is formula number (21)
function calculate_L(
        mu_value,
        h_value,
        knm_value,
        mn_value,
        c_value,
        ae_value,
        n_value
    )

    mu, h, knm, mn, c, ae = symbols("μ h knm [m,n] c ae")
    n, x = symbols("n x")

    besseljFunc(x) = besselj(n, x);
    besselyFunc(x) = bessely(n, x);

    besseljDerivativeExpression = diff(besseljFunc(knm*ae), knm)
    besselyDerivativeExpression = diff(besselyFunc(knm*ae), knm)

    expression = mu*h/(pi*knm^2*mn) * (
        besselj(n, knm*c)*besselyDerivativeExpression - bessely(n, knm*c)*besseljDerivativeExpression
    )^2

    return expression.subs([
        (mu, mu_value),
        (h, h_value),
        (knm, knm_value),
        (mn, mn_value),
        (c, c_value),
        (ae, ae_value),
        (n, n_value)
    ]).evalf()

end

# println(calculate_L(
#     2.2,
#     3.3,
#     4.4,
#     5.5,
#     1.3,
#     2.2,
#     2
# ))
