# Create a range of values from 1GHz to 5GHz, with a step size of 10MHz
f_range = range(10^9, stop=2*10^9, step=10*10^7)

# Convert the range to a vector
f_vector = collect(f_range)
Zin_array = []

f_value = 0
for ff in f_vector
    global f_value;
    f_value = ff
    include("calculateAllValuesForZin.jl")
    push!(Zin_array, calculate_Zin(
        Yeq_value,
        f_value,
        C_value,
        L_value
    ))
end

Zin_re_array = []
Zin_im_array = []


for zin in Zin_array
    push!(Zin_re_array, real(zin))
    push!(Zin_im_array, imag(zin))
end

plot_real = plot(f_range, Zin_re_array, title="Real part of Zin", label=["Rin(f)"], linewidth=3)
xlabel!("f")
savefig(plot_real, "plot_1_kartazijev_Zin_real.png")

plot_im = plot(f_range, Zin_im_array, title="Imaginary part of Zin", label=["Xin(f)"], linewidth=3)
xlabel!("f")
savefig(plot_im, "plot_1_kartazijev_Zin_im.png")


# In case of need for faster execution
#
# Zin_array = [
#     -2.74705789516808e-21 - 1.26320199561895e-21*1im,
#     -1.38960238306642e-23 - 5.76830802598006e-24*1im,
#     -7.02207404682781e-26 - 2.61175773770085e-26*1im,
#     -3.54453514987295e-28 - 1.1700251317859e-28*1im,
#     -1.78711037916057e-30 - 5.17147523267782e-31*1im,
#     -8.99970824427221e-33 - 2.24643851329193e-33*1im,
#     -4.52670185965522e-35 - 9.53533275227963e-36*1im,
#     -2.27408162819878e-37 - 3.91913045646734e-38*1im,
#     -1.14102939002607e-39 - 1.53539867284636e-40*1im,
#     -5.71808997938929e-42 - 5.55786574325363e-43*1im,
#     -2.86197292955691e-44 - 1.72097902504887e-45*1im
# ]
