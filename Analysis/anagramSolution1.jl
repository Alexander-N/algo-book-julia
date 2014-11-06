using Base.Test

function anagramSolution1(string1, string2)
    #this function is incorrect for multiple occurences of a character 
    
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

@test anagramSolution1("abcd","dcba") == true
@test anagramSolution1("abcd","cdbi") == false
@test anagramSolution1("abcd","dcbaaaa") == false
@test anagramSolution1("aacc","accc")  == false
