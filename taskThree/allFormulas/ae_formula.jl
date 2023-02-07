using SymPy

function calculateAe(a_value, h_value, xa_value, Er_value)
    a, h, xa, Er = symbols("a h xa ϵr")
    expresion = a * (1 - 2*h*xa/(pi*Er*a))^0.5
    newExp = expresion.subs([(a, a_value), (h, h_value), (xa, xa_value), (Er, Er_value)])
    return newExp.evalf()
end

# println(calculateAe(1, 1, 1, 1)) 0.602
