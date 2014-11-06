using Base.Test

function anagramSolution4(string1, string2)
    s1_occurences = Dict()
    s2_occurences = Dict()
    
    for (occurences, string) in zip([s1_occurences, s2_occurences], [string1, string2])
        for char in string
            if haskey(occurences, char)
                occurences[char] += 1
            else
                occurences[char] = 1
            end
        end
    end
    return s1_occurences == s2_occurences  
end

@test anagramSolution4("abcd","dcba") == true
@test anagramSolution4("abcd","cdbi") == false
@test anagramSolution4("abcd","dcbaaaa") == false
@test anagramSolution4("aacc","accc")  == false
