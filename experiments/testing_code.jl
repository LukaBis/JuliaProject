using ForwardDiff
using SpecialFunctions
using SymPy
using Roots

include("../taskOne/calculate_ae.jl")
include("../taskOne/calculate_be.jl")
include("../taskOne/calculate_fnm.jl")
include("../taskOne/calculate_knm.jl")
include("../taskOne/calculate_wr.jl")
include("../taskOne/calculate_xa.jl")
include("../taskOne/calculate_xb.jl")

knm, a, b, h, er, n, m, ae, be = symbols("knm a b h er n m ae be")

#### Testing values
a_value = 2.2
b_value = 3.1
h_value = 1.8
er_value = 3
n_value = 2
m_value = 3

# create an expression
x = symbols("x")
besseljFunction(x) = besselj(n, x);
besselyFunction(x) = bessely(n, x);

expression = diff(besselyFunction(knm * ae), knm) * diff(besseljFunction(knm * be), knm) - diff(besseljFunction(knm * ae), knm) * diff(besselyFunction(knm * be), knm)

# calculate all necessary values
xa_value = calculateXa(a_value, h_value, er_value)
xb_value = calculateXb(b_value, h_value, er_value)
ae_value = calculateAe(a_value, h_value, xa_value, er_value)
be_value = calculateBe(b_value, h_value, xb_value, er_value)

# substitute symbols with new values
newExpression = expression.subs([(ae, ae_value), (be, be_value), (n, n_value)])

function expression_func(x)
    return newExpression.subs(knm, x).evalf()
end

function expression_func_imag(x)
    return imag(newExpression.subs(knm, x).evalf())
end

# 1)
root = fzero(expression_func_imag, (-50, -48))
print("knm = ")
println(root)

# println("This should be zero: ")
# println(expression_func(-49.826473002406516))
# println("This should be zero: ")
# println(expression_func_imag(-49.826473002406516))

# https://docs.juliahub.com/Roots/o0Xsi/1.3.13/roots/#Potential-issues
# println("Expected difference:")
# println(expression_func_imag(root) * abs(root) * eps())


# 3)

# this time there is no N substitution
thirdExpression = expression.subs([(ae, ae_value), (be, be_value)])

function insertNinExpression(nParam)
    return thirdExpression.subs(n, nParam)
end

function third_expression_func(knmParam)
    return imag(thirdExpression.subs(knm, knmParam).evalf())
end

# calculate knm for n = 0 and m = 1
thirdExpression = insertNinExpression(0)

# knm_value = fzero(third_expression_func, (-50, -45))
# println("Firsrt knm")
# println(knm_value)

using Plots

# Define the function

# Create a range of x values to plot
x = range(-50, stop=-48, length=700)

# Evaluate the function at each x value
y = third_expression_func.(x)

# Create the plot
plot(x, y, label="f(x)", xlabel="knm", ylabel="y")

# Save the plot to a file
savefig("plot.png")
