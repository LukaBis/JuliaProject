a_range = range(1.5, stop=1.7, step=0.1)

# Convert the range to a vector
a_vector = collect(a_range)

f_value = 10^9
a_value = 0
b_value = 0
c_value = 0
er_value = 2.2
h_value = 1.59
n_value = 1
m_value = 2

Zin_array = []

for aa in a_vector
    global a_value
    global b_value
    global c_value

    a_value = aa
    b_value = a_value + 2.05
    c_value = a + 0.53

    include("calculateAllValuesForZin.jl")
    push!(Zin_array, calculate_Zin(
        Yeq_value,
        f_value,
        C_value,
        L_value
    ).subs(a, a_value).evalf())
end

Zin_re_array = []

for zin in Zin_array
    push!(Zin_re_array, real(zin))
end

plot_real = plot(a_range, Zin_re_array, title="Real part of Zin", label=["Rin(f)"], linewidth=3)
xlabel!("a")
savefig(plot_real, "plot_2_kartazijev_Zin_real.png")
