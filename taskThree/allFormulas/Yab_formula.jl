using SymPy
using QuadGK

# this is formula number (19)
function calculate_Yab(
        a_value,
        b_value,
        h_value,
        f_value, # used to get w = 2*pi*f
        k_value, # from formula (13)
    )

    mu_value = 4*pi*10^(-7) #μ
    e0_value = 8.854 * 10^(−12)
    k0_value = 2*pi*f_value * sqrt(mu_value*e0_value) # formula from end of task 2
    omega_value = 2*pi*f_value

    a, b, h, omega, mu, alpha, k, r1, k0, = symbols("a b h w μ α k r1 k0")
    e = exp(1)

    r1 = (a^2 + b^2 - 2*a*b*cos(alpha))^0.5
    expressionInIntegral = cos(alpha)*(e^(-1im*k*r1)/r1^3)*(2*(a + 1im*k0*r1)*cos(alpha) + (b*cos(alpha) - a)*(b - a*cos(alpha))/r1^2 * (k0^2 * r1^2 - 3*1im*k0*r1 - 3))
    ExpressionInIntegralReadyForIntegration = expressionInIntegral.subs([
        (k, k_value),
        (a, a_value),
        (b, b_value),
        (k0, k0_value)
    ])

    # this function calculates value of ExpressionInIntegralReadyForIntegration for given alpha_param
    functionExpressionInIntegral(alpha_param) = ExpressionInIntegralReadyForIntegration.subs([(alpha, alpha_param)]).evalf()

    # approximation for zero = 10^(-4) othervise program takes way too long to run
    integral, error_estimate = quadgk(functionExpressionInIntegral, 10^(-4), 2*pi - 10^(-4))

    expression = 1im*a*b*h/(2*pi*omega*mu)*integral

    return expression.subs([
        (a, a_value),
        (b, b_value),
        (h, h_value),
        (omega, omega_value),
        (mu, mu_value)
    ]).evalf()

end

# println(calculate_Yab(
#     2.2,
#     3,
#     3.2,
#     1000,
#     21
# ))
