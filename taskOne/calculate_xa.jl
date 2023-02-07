using SymPy

function calculateXa(a_value, h_value, Er_value)
    a, h, Er = symbols("a h ϵr")
    expresion = log(a/2*h) + 1.41*Er + 1.77 + h/a*(0.268*Er + 1.65)
    newExp = expresion.subs([(a, a_value), (h, h_value), (Er, Er_value)])
    return newExp.evalf()
end

# println(calculateXa(1,1,1)) 4.404
