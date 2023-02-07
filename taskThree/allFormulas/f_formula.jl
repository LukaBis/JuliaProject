using SymPy

function calculate_f(
        knm_value,
        er_value
    )

    knm, u0, e0, er = symbols("knm u0 ϵ0 ϵr")
    u0_value = 4*pi * 10^(-7)
    e0_value = 8.854 * 10^(-12)

    f_expression = knm / (2 * pi * sqrt(u0 * e0 * er))

    return f_expression.subs([
        (knm, knm_value),
        (u0, u0_value),
        (e0, e0_value),
        (er, er_value),
    ]).evalf()

end
