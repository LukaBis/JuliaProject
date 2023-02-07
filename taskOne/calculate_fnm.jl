using SymPy

function calculateFnm(knm_value, u0_value, E0_value, Er_value)
    knm, u0, E0, Er = symbols("knm µ0 ϵ0 ϵr")
    expresion = knm / (2*pi * sqrt(u0*E0*Er))
    newExp = expresion.subs([(knm, knm_value), (u0, u0_value), (E0, E0_value), (Er, Er_value)])
    return newExp.evalf()
end

# println(calculateFnm(1, 1, 1, 1)) # 0.159
