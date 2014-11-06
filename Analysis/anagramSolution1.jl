using Base.Test

function anagramSolution1(string1, string2)
    if length(string1) != length(string2)
        return false
    end
    string2 = [char for char in string2]
    for s1 in string1
        found = false
        for i in 1:length(string2) 
            if s1 == string2[i]
                found = true
                string2[i] = ' ' 
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
