using PyCall
@pyimport turtle

PART_OF_PATH = 'O'
TRIED = '.'
OBSTACLE = '+'
DEAD_END = '-'

type Maze
    mazelist
    rowsInMaze
    columnsInMaze
    xTranslate
    yTranslate
    t
    wn
    function Maze(mazeFileName)
        self = new()
        rowsInMaze = 0
        columnsInMaze = 0
        self.mazelist = Any[]
        open(mazeFileName) do mazeFile
            rowsInMaze = 0
            for line in eachline(mazeFile)
                rowList = Char[]
                col = 0
                for ch in line[1:end-1]
                    push!(rowList, ch)
                    if ch == 'S'
                        startRow = rowsInMaze
                        startCol = col
                    end
                    col = col + 1
                end
                rowsInMaze = rowsInMaze + 1
                push!(self.mazelist, rowList)
                columnsInMaze = length(rowList)
            end
        end
        self.rowsInMaze = rowsInMaze
        self.columnsInMaze = columnsInMaze
        self.xTranslate = -columnsInMaze/2
        self.yTranslate = rowsInMaze/2
        self.t = turtle.Turtle()
        self.t[:shape]("turtle")
        self.wn = turtle.Screen()
        self.wn[:setworldcoordinates](-columnsInMaze/2+1,-rowsInMaze/2,columnsInMaze/2+0.5,rowsInMaze/2-0.75)
        return self
    end
end

function drawMaze(maze::Maze)
    maze.t[:speed](500)
    for y in 1:maze.rowsInMaze
        for x in 1:maze.columnsInMaze
            if maze.mazelist[y][x] == OBSTACLE
                drawCenteredBox(maze.t,x+maze.xTranslate,-y+maze.yTranslate,"orange")
            end
        end
    end
    maze.t[:color]("black")
    maze.t[:fillcolor]("blue")
end

function drawCenteredBox(t, x, y, color)
    t[:up]()
    t[:goto](x-0.5,y-0.5)
    t[:color](color)
    t[:fillcolor](color)
    t[:setheading](90)
    t[:down]()
    t[:begin_fill]()
    for i in 1:4
        t[:forward](1)
        t[:right](90)
    end
    t[:end_fill]()
end

myMaze = Maze("maze2.txt")
drawMaze(myMaze)
myMaze.wn[:exitonclick]()