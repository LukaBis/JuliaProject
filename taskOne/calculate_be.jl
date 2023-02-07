using SymPy

function calculateBe(b_value, h_value, xb_value, Er_value)
    b, h, xb, Er = symbols("b h xb ϵr")
    expresion = b*(1 + 2*h*xb/(pi*Er*b))^0.5
    newExp = expresion.subs([(b, b_value), (h, h_value), (xb, xb_value), (Er, Er_value)])
    return newExp.evalf()
end

#println(calculateBe(1,1,1,1)) # 1.279
