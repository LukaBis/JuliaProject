using SymPy

function calculateKnm(wr_value, u0_value, Er_value, E0_value)
    wr, u0, E0, Er = symbols("wr µ0 ϵ0 ϵr")
    expresion = wr * sqrt(u0 * E0 * Er)
    newExp = expresion.subs([(wr, wr_value), (u0, u0_value), (Er, Er_value), (E0, E0_value)])
    return newExp.evalf()
end

#println(calculateKnm(1,1,1,1))
