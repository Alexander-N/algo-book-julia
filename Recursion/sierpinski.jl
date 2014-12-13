using PyCall
@pyimport turtle

function drawTriangle(points, color, myTurtle)
    myTurtle[:fillcolor](color)
    myTurtle[:up]()
    myTurtle[:goto](points[1,1], points[1,2])
    myTurtle[:down]()
    myTurtle[:begin_fill]()
    myTurtle[:goto](points[2,1], points[2,2])
    myTurtle[:goto](points[3,1], points[3,2])
    myTurtle[:goto](points[1,1], points[1,2])
    myTurtle[:end_fill]()
end

function getMid(p1, p2)
    [(p1[1]+p2[1])/2 (p1[2]+p2[2])/2]
end

function sierpinski(points, degree, myTurtle)
    colormap = ["blue","red","green","white","yellow",
                "violet","orange"]
    drawTriangle(points,colormap[degree],myTurtle)
    if degree > 0
        sierpinski([points[1,:],
                        getMid(points[1,:]], points[2,:]]),
                        getMid(points[1,:]], points[3,:]])],
                   degree-1, myTurtle)
        sierpinski([points[2,:]],
                        getMid(points[1,:]], points[2,:]]),
                        getMid(points[2,:]], points[3,:]])],
                   degree-1, myTurtle)
        sierpinski([points[3,:]],
                        getMid(points[3,:]], points[2,:]]),
                        getMid(points[1,:]], points[3,:]])],
                   degree-1, myTurtle)
    end
end


function main()
    myTurtle = turtle.Turtle()
    myWin = turtle.Screen()
    myPoints = [-100 -50; 0 100; 100 -50]
    drawTriangle(myPoints, "green", myTurtle)
    myWin[:exitonclick]()
end

main()

