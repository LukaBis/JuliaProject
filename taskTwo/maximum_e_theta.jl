using SymPy
using SpecialFunctions
using LinearAlgebra

function maximum_abs_e_theta()

    max = 0;
    for theta_val in 0:90
        val = -(1im)^(n_value)*(exp(-1im * k0_value * r_value)/r_value)*(k0_value/(2 * Fnm_rho0_value))*cos(n_value * 0) *
        (b_value * Fnmb_value * (besselj(n_value - 1, k0_value * b_value * sin(theta_val)) - besselj(n_value + 1, k0_value * b_value * sin(theta_val))) - a_value * Fnma_value * (besselj(n_value - 1, k0_value * a_value * sin(theta_val)) - besselj(n_value + 1, k0_value * a_value * sin(theta_val))))

        if theta_val == 0
            max = abs(val)
        end # if

        if abs(val) > max
            max = abs(val)
        end # if
    end #for

    return max
end #function
