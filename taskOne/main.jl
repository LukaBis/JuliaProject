using ForwardDiff
using SpecialFunctions
using SymPy
using Roots
using PrettyTables

knm, n = symbols("knm n")

a_value  = 0.013
b_value  = 0.023
h_value  = 0.001576
er_value = 2.52
u0_value = 4*pi*10^(-7)
e0_value = 8.854 * 10^(-12)

# create an expression
x = symbols("x")
besseljFunction(x) = besselj(n, x);
besselyFunction(x) = bessely(n, x);

# calculate all necessary values
xa_value = log(a_value/2 * h_value) + 1.41 * er_value + 1.77 + h_value/a_value*(0.268 * er_value + 1.65)
xb_value = log(b_value/2 * h_value) + 1.41*er_value + 1.77 + h_value/b_value*(0.268 * er_value + 1.65)
ae_value = a_value * (1 - 2 * h_value * xa_value / (pi * er_value * a_value))^0.5
be_value = b_value * (1 + 2 * h_value * xb_value / (pi*er_value * b_value))^0.5

expression_without_n_value = diff(besselyFunction(knm * ae_value), knm) * diff(besseljFunction(knm * be_value), knm) - diff(besseljFunction(knm * ae_value), knm) * diff(besselyFunction(knm * be_value), knm)
expression = expression_without_n_value

# This function calculates value of a function for a given x value that gets substituted with knm
function calculate_expression(x)
    return expression.subs(knm, x).evalf()
end

# find bracketing interval
zero_approximation = 1e-10
start_interval = zero_approximation
end_interval = zero_approximation

println("Finding bracketing intervals...")

bracketing_intervals = []

# find all bracketing intervals
for n_value in 0:5

    global start_interval
    global end_interval
    global expression

    interval = []
    expression = expression_without_n_value.subs(n, n_value)

    # find 5 zeros of a function for a give n_value
    for m_value in 1:5
        functionValueAtStart = calculate_expression(start_interval)
        functionValueAtEnd = calculate_expression(end_interval)

        # in this loop we find bracketing interval
        while sign(functionValueAtStart) == sign(functionValueAtEnd)
            end_interval += 5
            functionValueAtEnd = calculate_expression(end_interval)
        end # while

        # add new bracketing interval
        start_interval = end_interval - 15
        new_bracketing_interval = (start_interval, end_interval)
        push!(interval, new_bracketing_interval)
        println("Bracketing interval $m_value/5")

        start_interval = end_interval;
    end # for

    push!(bracketing_intervals, interval)
    println("All bracketing intervals for n $n_value/5 done")

end # for

table_values = [
    0 0.0 0.0 0.0 0.0 0.0;
    1 0.0 0.0 0.0 0.0 0.0;
    2 0.0 0.0 0.0 0.0 0.0;
    3 0.0 0.0 0.0 0.0 0.0;
    4 0.0 0.0 0.0 0.0 0.0;
    5 0.0 0.0 0.0 0.0 0.0;
]

println("Calculating all fnm values...")

# find 5 zeros of a function for each value of n
# 5 zeros because m = [0,5]
for n_value in 0:5

    global expression
    global u0_value
    global e0_value

    for m_value in 1:5
        expression = expression_without_n_value.subs(n, n_value)
        bracketing_interval = bracketing_intervals[n_value + 1][m_value]
        knm_value = fzero(calculate_expression, bracketing_interval)
        fnm_value = knm_value / (2*pi * sqrt(u0_value * e0_value * er_value))
        table_values[n_value + 1, m_value + 1] = fnm_value
        println("function root m $m_value/5")
    end
    println("All roots for n $n_value/5 done.")
end

println("")
println("")
println("")
println("")

header_row = [0, 1, 2, 3, 4, 5]

pretty_table(table_values, header=header_row)
