function anagramSolution2(string1, string2)
    sort!(string1.data)
    sort!(string2.data)
    return string1 == string2
end

println(anagramSolution2("abcd","dcba"))
println(anagramSolution2("abcd","cdba"))
println(anagramSolution2("abcd","cdbi"))
println(anagramSolution1("abcd","dcbaaaa"))
