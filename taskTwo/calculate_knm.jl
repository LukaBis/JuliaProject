using SymPy
using SpecialFunctions
using Roots

# create an expression
x, knm, n = symbols("x knm n")
besseljFunction(x) = besselj(n, x);
besselyFunction(x) = bessely(n, x);

# calculate all necessary values for expression
xa_value = log(a_value/2 * h_value) + 1.41 * er_value + 1.77 + h_value/a_value*(0.268 * er_value + 1.65)
xb_value = log(b_value/2 * h_value) + 1.41*er_value + 1.77 + h_value/b_value*(0.268 * er_value + 1.65)
ae_value = a_value * (1 - 2 * h_value * xa_value / (pi * er_value * a_value))^0.5
be_value = b_value * (1 + 2 * h_value * xb_value / (pi*er_value * b_value))^0.5

expression_without_n_value = diff(besselyFunction(knm * ae_value), knm) * diff(besseljFunction(knm * be_value), knm) - diff(besseljFunction(knm * ae_value), knm) * diff(besselyFunction(knm * be_value), knm)
expression = expression_without_n_value.subs(n, n_value)

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

# in this loop we find bracketing interval
while sign(functionValueAtStart) == sign(functionValueAtEnd)

    global start_interval
    global end_interval
    global functionValueAtEnd
    global functionValueAtStart

    end_interval += 5
    functionValueAtEnd = calculate_expression(end_interval)

end # while

start_interval = end_interval - 15
knm_value = fzero(calculate_expression, (start_interval, end_interval))
