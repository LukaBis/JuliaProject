using SymPy
using SpecialFunctions

# formula (22)
function calculate_C(
        mn_value,
        er_value,
        h_value,
        knm_value,
        c_value,
        ae_value,
        n_value
    )

    e0, er, h, knm, c, ae, mn = symbols("ϵ0 ϵr h knm c ae [m,n]")
    n, x = symbols("n x")

    e0_value = 8.854 * 10^(-12)

    besseljFunc(x) = besselj(n, x);
    besselyFunc(x) = bessely(n, x);

    besseljDerivativeExpression = diff(besseljFunc(knm*ae), knm)
    besselyDerivativeExpression = diff(besselyFunc(knm*ae), knm)

    expression = pi * mn * e0 * er / (h * (besselj(n, knm*c) * besselyDerivativeExpression -
                bessely(n, knm*c) * besseljDerivativeExpression))

    return expression.subs([
        (mn, mn_value),
        (e0, e0_value),
        (er, er_value),
        (h, h_value),
        (knm, knm_value),
        (c, c_value),
        (ae, ae_value),
        (n, n_value)
    ]).evalf()

end

# println(calculate_C(
#     3.3,
#     2.52,
#     8,
#     4.4,
#     2.3,
#     2.2,
#     2
# ))
