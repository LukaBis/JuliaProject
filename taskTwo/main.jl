using Plots

include("calculate_e_theta.jl")
include("calculate_e_theta_normalized.jl")
include("calculate_e_phi_normalized.jl")
include("calculate_e_phi.jl")
include("calculate_fnm.jl")
include("calculate_k0.jl")

# UNOS PODATAKA
println("Input a [1,3]")
a_value = readline()
a_value = parse(Float32, a_value)

println("Input b > a + 0.5")
b_value = readline()
b_value = parse(Float32, b_value)

println("Input n")
n_value = readline()
n_value = parse(Int32, n_value)

println("Input f > 1GHz")
f_value = readline()
f_value = parse(Int64, f_value)

println("Input ρ")
rho_value = readline()
rho_value = parse(Float32, rho_value)

println("Input θ")
theta_value = readline()
theta_value = parse(Float32, theta_value)

println("Input ρ0")
rho0_value = readline()
rho0_value = parse(Float32, rho0_value)

### hardcoded values
# a_value = 2.2
# b_value = 3.1
# n_value = 4
# f_value = 20000000000
# rho_value = 30
# phi_value = 0
# theta_value = 1
# rho0_value = 20

# θ theta
# ϕ phi
println("Loading...")

r_value = 1
k0_value = calculate_k0(f_value)
Fnm_rho0_value = calculate_fnm(k0_value, a_value, rho_value, n_value)
Fnmb_value = calculate_fnm(k0_value, a_value, b_value, n_value)
Fnma_value = calculate_fnm(k0_value, a_value, a_value, n_value)


# Define the data to be plotted

theta = range(0, stop=90)
e_theta_arr = []

for th in theta
    e_th_norm = calculate_e_theta_normalized(
        n_value,
        k0_value,
        r_value,
        Fnm_rho0_value,
        b_value,
        Fnmb_value,
        th,
        a_value,
        Fnma_value
    )

    push!(e_theta_arr, e_th_norm)
end # for

# Create e theta charts
pl1 = plot(theta, e_theta_arr, proj=:polar, lims=(-30, 30))
pl2 = plot(theta, e_theta_arr)
savefig(pl1, "plot_polar_e_theta.png")
savefig(pl2, "plot_kartazijev_e_theta.png")

println("E theta charts done")
println("Loading...")


# same for e phi part

theta = range(0, stop=90)
e_phi_arr = []

for th in theta
    e_ph_norm = calculate_e_phi_normalized(
        n_value,
        k0_value,
        r_value,
        Fnm_rho0_value,
        b_value,
        Fnmb_value,
        th,
        a_value,
        Fnma_value
    )

    push!(e_phi_arr, e_ph_norm)
end # for

# Create e theta charts
pl1 = plot(theta, e_phi_arr, proj=:polar, lims=(-30, 30))
pl2 = plot(theta, e_phi_arr)
savefig(pl1, "plot_polar_e_phi.png")
savefig(pl2, "plot_kartazijev_e_phi.png")

println("E phi charts done")
