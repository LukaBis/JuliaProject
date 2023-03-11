using Plots

a_value  = 0.013
b_value  = 0.023
rho_value = 0.018 # a < rho < b
h_value  = 0.001576
er_value = 2.52
u0_value = 4*pi*10^(-7)
e0_value = 8.854 * 10^(-12)
n_value = 2
m_value = 1
r_value = 1
v0_value = 1

# θ theta
# ϕ phi

# calculate knm for given n and m and stores it inside knm_value
include("./calculate_knm.jl")
# gives access to calculate_fnm function
include("./calculate_fnm.jl")

k0_value = knm_value / sqrt(er_value)
Fnm_rho0_value = calculate_fnm(k0_value, a_value, rho_value, n_value)
Fnmb_value = calculate_fnm(k0_value, a_value, b_value, n_value)
Fnma_value = calculate_fnm(k0_value, a_value, a_value, n_value)


# Define the data to be plotted

# gives access to calculate_e_theta_normalized function
include("./calculate_e_theta_normalized.jl")

theta_range = range(1, stop=90)
e_theta_arr = []

for theta in theta_range
    e_th_norm = calculate_e_theta_normalized(theta)
    push!(e_theta_arr, e_th_norm)
    println("theta $theta/90")
end # for


# # Create e theta charts
pl1 = plot(theta_range, e_theta_arr, proj=:polar)
pl2 = plot(theta_range, e_theta_arr)
savefig(pl1, "plot_polar_e_theta.png")
savefig(pl2, "plot_kartazijev_e_theta.png")
#
println("E theta charts done")
# println("Loading...")
#
#
# # same for e phi part
#
# theta = range(0, stop=90)
# e_phi_arr = []
#
# for th in theta
#     e_ph_norm = calculate_e_phi_normalized(
#         n_value,
#         k0_value,
#         r_value,
#         Fnm_rho0_value,
#         b_value,
#         Fnmb_value,
#         th,
#         a_value,
#         Fnma_value
#     )
#
#     push!(e_phi_arr, e_ph_norm)
# end # for
#
# # Create e theta charts
# pl1 = plot(theta, e_phi_arr, proj=:polar, lims=(-30, 30))
# pl2 = plot(theta, e_phi_arr)
# savefig(pl1, "plot_polar_e_phi.png")
# savefig(pl2, "plot_kartazijev_e_phi.png")
#
# println("E phi charts done")
