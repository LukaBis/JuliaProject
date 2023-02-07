using SymPy
using SpecialFunctions
using LinearAlgebra

include("maximum_e_phi.jl")
include("calculate_e_phi.jl")

e_phi, e_phi_max = symbols("Eϕ Eϕmax")

e_phi_normalized_expression = 20*log(10, abs(e_phi)/abs(e_phi_max))

function calculate_e_phi_normalized(
        n_value,
        k0_value,
        r_value,
        Fnm_rho0_value,
        b_value,
        Fnmb_value,
        theta_value,
        a_value,
        Fnma_value
    )

    phi_value = 90
    e_phi_value = calculate_e_phi(
        n_value,
        k0_value,
        r_value,
        Fnm_rho0_value,
        phi_value,
        b_value,
        Fnmb_value,
        theta_value,
        a_value,
        Fnma_value
    )

    maximum_abs_e_phi_value = maximum_abs_e_phi(
        n_value,
        k0_value,
        r_value,
        Fnm_rho0_value,
        phi_value,
        b_value,
        Fnmb_value,
        a_value,
        Fnma_value
    )

    return e_phi_normalized_expression.subs([
        (e_phi, e_phi_value),
        (e_phi_max, maximum_abs_e_phi_value)
    ]).evalf()

end # function
