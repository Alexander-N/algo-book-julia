function moveTower(height::Int, fromPole::Char, toPole::Char, withPole::Char)
    if height >= 1
        moveTower(height-1,fromPole,withPole,toPole)
        moveDisk(fromPole,toPole)
        moveTower(height-1,withPole,toPole,fromPole)
    end
end

function moveDisk(fp, tp)
    println("moving disk from $fp to $tp")
end

moveTower(3,'A','B','C')
       
