using Base.Test

function hash(astring, tablesize)
    sum([character for character in astring]) % 100
end

@test hash("test", 100) == 48 
