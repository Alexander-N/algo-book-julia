using Base.Test

function anagramSolution2(string1, string2)
    sort!(string1.data)
    sort!(string2.data)
    return string1 == string2
end

@test anagramSolution2("abcd","dcba") == true
@test anagramSolution2("abcd","cdbi") == false
@test anagramSolution2("abcd","dcbaaaa") == false
@test anagramSolution2("aacc","accc")  == false
