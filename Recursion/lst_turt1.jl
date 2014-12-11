using PyCall
@pyimport turtle

myTurtle = turtle.Turtle()
myWin = turtle.Screen()

function drawSpiral(myturtle, lineLen)
    if lineLen > 0
        myTurtle[:forward](lineLen)
        myTurtle[:right](90)
        drawSpiral(myTurtle, lineLen-5)
    end
end

drawSpiral(myTurtle, 100)
myWin[:exitonclick]()
