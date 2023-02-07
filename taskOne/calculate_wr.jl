using SymPy

function calculateWr(fnm_value)
    fnm = symbols("fnm")
    expresion = 2*pi*fnm
    newExp = expresion.subs([(fnm, fnm_value)])
    return newExp.evalf()
end

#println(calculateWr(1))
