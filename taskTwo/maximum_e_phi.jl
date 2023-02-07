using SymPy
using SpecialFunctions
using LinearAlgebra

include("calculate_e_phi.jl")

function maximum_abs_e_phi(
        n_value,
        k0_value,
        r_value,
        Fnm_value,
        phi_value,
        b_value,
        Fnmb_value,
        a_value,
        Fnma_value
    )

    max = 0;
    for theta_val in 0:90
        val = abs(calculate_e_phi(
            n_value,
            k0_value,
            r_value,
            Fnm_value,
            phi_value,
            b_value,
            Fnmb_value,
            theta_val,
            a_value,
            Fnma_value
        ))

        if theta_val == 0
            max = val
        end # if

        if val > max
            max = val
        end # if
    end #for

    return max
end #function
