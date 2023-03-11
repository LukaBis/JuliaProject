using SymPy
using SpecialFunctions
using LinearAlgebra

# gives access to maximum_abs_e_theta function that calculates maximum value of e theta
include("maximum_e_theta.jl")


function calculate_e_theta_normalized(theta)

    global n_value, k0_value, r_value, Fnm_rho0_value, b_value, Fnmb_value

    e_theta_value = -(1im)^(n_value)*(exp(-1im * k0_value * r_value)/r_value)*(k0_value/(2 * Fnm_rho0_value))*cos(n_value * 0) *
    (b_value * Fnmb_value * (besselj(n_value - 1, k0_value * b_value * sin(theta)) - besselj(n_value + 1, k0_value * b_value * sin(theta))) - a_value * Fnma_value * (besselj(n_value - 1, k0_value * a_value * sin(theta)) - besselj(n_value + 1, k0_value * a_value * sin(theta))))

    maximum_abs_e_theta_value = maximum_abs_e_theta()
    
    return 20*log(10, abs(e_theta_value)/maximum_abs_e_theta_value).evalf()

end
