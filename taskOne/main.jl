using ForwardDiff
using SpecialFunctions
using SymPy
using Roots
using PrettyTables

include("calculate_ae.jl")
include("calculate_be.jl")
include("calculate_fnm.jl")
include("calculate_knm.jl")
include("calculate_wr.jl")
include("calculate_xa.jl")
include("calculate_xb.jl")

knm, a, b, h, er, n, m, ae, be = symbols("knm a b h er n m ae be")

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

# this takes only imaginary part, we use it later to find zero of a function
# where this imaginary part is equal to zero that is where the zero point is
function expression_func_imag(x)
    return imag(newExpression.subs(knm, x).evalf())
end

# 1)
root = fzero(expression_func_imag, (-50, -48))
print("knm = ")
println(root)


# 2)
knm_value = root;
u0_value = 4*pi*10^(-7)
e0_value = 8.854 * 10^(-12)

fnm = calculateFnm(knm_value, u0_value, e0_value, er_value)
print("fnm = ")
println(fnm)

# 3)

println("Loading table ...")

# this time there is no N substitution
thirdExpression = expression.subs([(ae, ae_value), (be, be_value)])
templateExpression = thirdExpression

function insertNinExpression(nParam)
    return templateExpression.subs(n, nParam)
end

function third_expression_func(knmParam)
    return imag(thirdExpression.subs(knm, knmParam).evalf())
end

# Load data in array

tableValues = Array{Sym, 2}(undef, 6, 6)
newThirdExpression = thirdExpression

for n = 0:5
    for m = 1:6
        if m == 1
            tableValues[n + 1, m] = n
        else
            global thirdExpression
            global knm_value
            thirdExpression = insertNinExpression(n)
            knm_value = fzero(third_expression_func, (-50, -48))
            fnm_value = calculateFnm(knm_value, u0_value, e0_value, er_value)
            tableValues[n + 1, m] = fnm_value
        end
    end
end

# Display table using data from array
pretty_table(tableValues; header = ["", 1, 2, 3, 4, 5])
