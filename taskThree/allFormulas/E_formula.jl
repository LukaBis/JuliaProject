using SymPy

# NOT USED

# this expression can be used for formulas Ea (16), Eb (17), Ec (18)
function calculate_E(
        Fnm_value,
        n_value
    )

    E0, Fnm, phi, n = symbols("E0 Fnm ϕ n")

    # we set E0 to value of 1 and phi to value of 0 so this entire expression
    # actually equals to Fnm
    E_expression = E0 * Fnm * cos(n * phi)

    return E_expression.subs([
        (E0, 1),
        (phi, 0)
    ])

end
