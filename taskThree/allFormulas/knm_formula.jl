using SymPy

# from formula (13)
function calculate_knm(
        f_value,
        epsilonr_value
    )

    f, mu0, epsilon0, epsilonr = symbols("f µ0 ϵ0 ϵr")
    mu0_value = 4*pi*10^(-7)
    epsilon0_value = 8.854*10^(-12)

    expression = f * 2*pi * sqrt(mu0 * epsilon0 * epsilonr)

    return expression.subs([
        (f, f_value),
        (mu0, mu0_value),
        (epsilon0, epsilon0_value),
        (epsilonr, epsilonr_value),
    ]).evalf()

end

#println(calculate_knm(300, 2.52))
