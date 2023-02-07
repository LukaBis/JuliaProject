using SymPy

function calculateXb(b_value, h_value, Er_value)
    b, h, Er = symbols("b h ϵr")
    expresion = log(b/2*h) + 1.41*Er + 1.77 + h/b*(0.268*Er + 1.65)
    newExp = expresion.subs([(b, b_value), (h, h_value), (Er, Er_value)])
    return newExp.evalf()
end

#println(calculateXb(1,1,1)) # 4.404
