using SymPy

# formula (14)
function calculate_Yeq(
        h_value,
        Ea_value,
        Eb_value,
        Ec_value,
        ga_value,
        gb_value,
        Yab_value
    )

    h, Ea, Eb, Ec, ga, gb, Yab = symbols("h Ea Eb Ec ga gb Yab")

    expression = pi/h * ((Ea/Ec)^2 * ga + (Eb/Ec)^2*gb - 2*Ea*Eb/Ec^2 * Yab)

    return expression.subs([
        (h, h_value),
        (Ea, Ea_value),
        (Eb, Eb_value),
        (Ec, Ec_value),
        (ga, ga_value),
        (gb, gb_value),
        (Yab, Yab_value),
    ]).evalf()

end

# println(calculate_Yeq(
#     2,
#     3.3,
#     4.4,
#     5.5,
#     33,
#     44,
#     1.81
# ))
