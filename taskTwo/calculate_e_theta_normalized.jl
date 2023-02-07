using SymPy
using SpecialFunctions
using LinearAlgebra

include("maximum_e_theta.jl")
include("calculate_e_theta.jl")

e_theta, e_theta_max = symbols("Eθ Eθmax")

e_theta_normalized_expression = 20*log(10, abs(e_theta)/abs(e_theta_max))

function calculate_e_theta_normalized(
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
    
    phi_value = 0
    e_theta_value = calculate_e_theta(
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

    maximum_abs_e_theta_value = maximum_abs_e_theta(
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

    return e_theta_normalized_expression.subs([
        (e_theta, e_theta_value),
        (e_theta_max, maximum_abs_e_theta_value)
    ]).evalf()

end # function
