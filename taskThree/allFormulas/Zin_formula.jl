using SymPy

# this is formula number (12)
function calculate_Zin(
        Yeq_value,
        f_value,
        C_value,
        L_value
    )

    Yeq, f, C, w, L = symbols("Yeq f C w L")

    expression = 1/(Yeq + 1im*2*pi*f*C + (1/(1im*2*pi*f*w*L)))
    w_value = 2*pi*f_value

    return expression.subs([
        (Yeq, Yeq_value),
        (f, f_value),
        (C, C_value),
        (L, L_value),
        (w, w_value),
    ]).evalf()

end

# println(calculate_Zin(
#     2.2,
#     1000,
#     4.4,
#     5.5
# ))
