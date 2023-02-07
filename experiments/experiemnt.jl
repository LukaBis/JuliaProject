using ForwardDiff
using SpecialFunctions
using SymPy
using Roots

# x, y = symbols("x y")
# func(x) = sin(x) + 3*x^2
# expression = diff(func(y), y) * 5
#
# function g(x)
#     return expression.subs(y, x).evalf()
# end
#
# println(g(1))

######### PLOT

# using Plots
#
# # Define the function
#
# # Create a range of x values to plot
# x = range(-350, stop=-349, length=700)
#
# # Evaluate the function at each x value
# y = expression_func.(x)
#
# # Create the plot
# plot(x, y, label="f(x)", xlabel="x", ylabel="y")
#
# # Save the plot to a file
# savefig("plot.png")


#########  finding root

# func(x) = x^2 + x - 8
# root = fzeros(func, (-10, 10))
# println(root)
# println(func(-3.3722813232690143))

for n=0:5, m=1:5
    println(n, m)
end
