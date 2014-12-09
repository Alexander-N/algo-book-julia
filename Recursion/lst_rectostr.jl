function toStr(n::Int, base::Int)
    convertString = "0123456789ABCDEF"
    if n < base
        convertString[n+1]
    else
        return string(toStr(div(n,base), base), convertString[(n%base)+1])
    end
end
                     
println(toStr(1453,16))
