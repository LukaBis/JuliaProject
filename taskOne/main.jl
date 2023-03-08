using ForwardDiff
using SpecialFunctions
using SymPy
using Roots
using PrettyTables

knm, n = symbols("knm n")

a_value = 0.013
b_value = 0.023
h_value = 0.001576
er_value = 2.52
n_value = 2
m_value = 1

# create an expression
x = symbols("x")
besseljFunction(x) = besselj(n, x);
besselyFunction(x) = bessely(n, x);

# calculate all necessary values
xa_value = log(a_value/2 * h_value) + 1.41 * er_value + 1.77 + h_value/a_value*(0.268 * er_value + 1.65)
xb_value = log(b_value/2 * h_value) + 1.41*er_value + 1.77 + h_value/b_value*(0.268 * er_value + 1.65)
ae_value = a_value * (1 - 2 * h_value * xa_value / (pi * er_value * a_value))^0.5
be_value = b_value * (1 + 2 * h_value * xb_value / (pi*er_value * b_value))^0.5

expression = diff(besselyFunction(knm * ae_value), knm) * diff(besseljFunction(knm * be_value), knm) - diff(besseljFunction(knm * ae_value), knm) * diff(besselyFunction(knm * be_value), knm)
expression = expression.subs(n, n_value)

# This function calculates value of a function for a given x value that gets substituted with knm
function calculate_expression(x)
    return expression.subs(knm, x).evalf()
end

# find bracketing interval
zero_approximation = 1e-10
start_interval = zero_approximation
end_interval = zero_approximation

functionValueAtStart = calculate_expression(start_interval)
functionValueAtEnd = calculate_expression(end_interval)

println("Finding bracketing interval...")

while sign(functionValueAtStart) == sign(functionValueAtEnd)
    global end_interval
    global functionValueAtEnd
    end_interval += 0.1
    functionValueAtEnd = calculate_expression(end_interval)
end

# make bracketing interval smaller
start_interval = end_interval - 1
bracketing_interval = (start_interval, end_interval)

# 1) 
root = fzero(calculate_expression, bracketing_interval)
println("knm = $root")

# 2)
knm_value = root
u0_value = 4*pi*10^(-7)
e0_value = 8.854 * 10^(-12)

fnm_value = knm_value / (2*pi * sqrt(u0_value * e0_value * er_value))

println("fnm = $fnm_value")