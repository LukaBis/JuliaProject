using SymPy
using SpecialFunctions
using LinearAlgebra

function calculate_e_theta(
        n_value,
        k0_value,
        r_value,
        Fnm_value,
        phi_value,
        b_value,
        Fnmb_value,
        theta_value,
        a_value,
        Fnma_value
    )

    n, k0, r, Fnm, phi, b, Fnmb, theta, a, Fnma, rho0 = symbols("n k0 r Fnm(ρ0) ϕ b Fnm(b) θ a Fnm(a) ρ0")

    # V0 = 1, V0 is omitted
    e_theta_expression =
        -(1im)^(n)*(exp(-1im * k0 * r)/r)*(k0/(2 * Fnm))*cos(n*phi) *
        (b*Fnmb*(besselj(n - 1, k0*b*sin(theta)) - besselj(n + 1, k0*b*sin(theta))) - a*Fnma * (besselj(n - 1, k0 * a * sin(theta)) - besselj(n + 1, k0 * a * sin(theta))))
    
    return e_theta_expression.subs([
        (n, n_value),
        (k0, k0_value),
        (r, r_value),
        (Fnm, Fnm_value),
        (b, b_value),
        (Fnmb, Fnmb_value),
        (theta, theta_value),
        (a, a_value),
        (Fnma, Fnma_value),
        (phi, phi_value)
    ]).evalf()
end


### values for testing purposes

# n_value = 3
# k0_value = 3.45
# r_value = 1
# Fnm_value = 3.4
# phi_value = 0
# b_value = 3.1
# Fnmb_value = 2
# theta_value = 2.2
# a_value = 2.4
# Fnma_value = 4
#
# println(calculate_e_theta(
#     n_value,
#     k0_value,
#     r_value,
#     Fnm_value,
#     phi_value,
#     b_value,
#     Fnmb_value,
#     theta_value,
#     a_value,
#     Fnma_value
# ))
