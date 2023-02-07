using SymPy
using SpecialFunctions

# formula (20)
function calculate_mn(
        knm_value,
        ae_value,
        be_value,
        n_value
    )

    knm, ae, be = symbols("knm ae be")
    n, x = symbols("n x")

    besseljFunc(x) = besselj(n, x);
    besselyFunc(x) = bessely(n, x);

    besseljDerivativeExpression = diff(besseljFunc(knm*ae), knm)
    besselyDerivativeExpression = diff(besselyFunc(knm*ae), knm)

    expression = 1/(2*knm)^2 * ((knm^2 * be^2 - 1) * (besselj(n, knm*be) * besselyDerivativeExpression -
                bessely(n, knm*be)*besseljDerivativeExpression)^2 - 4/(pi^2 * knm^2 * ae^2) * (knm^2 * ae^2 - 1))

    return expression.subs([
        (knm, knm_value),
        (ae, ae_value),
        (be, be_value),
        (n, n_value)
    ]).evalf()

end

# println(calculate_mn(
#     4.4,
#     2.2,
#     3.3,
#     2
# ))
