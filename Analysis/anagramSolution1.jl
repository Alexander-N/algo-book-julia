function anagramSolution1(string1, string2)
    if length(string1) != length(string2)
        return false
    end
    for s1 in string1
        found = false
        for s2 in string2
            if s1 == s2
                found = true
            end
        end
        if !found
            return false
        end
    end
    return true
end

println(anagramSolution1("abcd","dcba"))
println(anagramSolution1("abcd","cdba"))
println(anagramSolution1("abcd","cdbi"))
println(anagramSolution1("abcd","dcbaaaa"))
