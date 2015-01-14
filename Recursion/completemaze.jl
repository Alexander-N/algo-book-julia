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
    startRow
    startCol
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
                        self.startRow = rowsInMaze
                        self.startCol = col
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
    maze.t[:speed](5000)
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

function moveTurtle(maze, x, y)
    maze.t[:up]()
    maze.t[:setheading](maze.t[:towards](x+maze.xTranslate,-y+maze.yTranslate))
    maze.t[:goto](x+maze.xTranslate,-y+maze.yTranslate)
end

function dropBreadCrump(t, color)
    t[:dot](10, color)
end

function updatePosition(maze, row, col, val=nothing)
    if val != nothing
        maze.mazelist[row][col] = val
    end
    moveTurtle(maze, col, row)
    if val == PART_OF_PATH
        color = "green"
    elseif val == OBSTACLE
        color = "red"
    elseif val == TRIED
        color = "black"
    elseif val == DEAD_END
        color = "red"
    else
        color = nothing 
    end

    if color != nothing
        dropBreadCrump(maze.t, color)
    end
    
end

function isExit(maze, row, col)
    return (row == 1 ||
            row == maze.rowsInMaze ||
            col == 1 ||
            col == maze.columnsInMaze)
end

function searchFrom(maze, startRow, startColumn)
    # try each of four directions from this point until we find a way out.
    # base Case return values:
    # 1. We have run into an obstacle, return false
    updatePosition(maze, startRow, startColumn)
    if maze.mazelist[startRow][startColumn] == OBSTACLE
        return false
    # 2. We have found a square that has already been explored 
    elseif maze.mazelist[startRow][startColumn] == TRIED
        return false
    # 3. We have found an outside edge not occupied by an obstacle
    elseif isExit(maze, startRow, startColumn)
        return true
    end
    # Otherwise, use logical short circuiting to try each direction
    # in turn (if needed)
end


myMaze = Maze("maze2.txt")
drawMaze(myMaze)
updatePosition(myMaze, myMaze.startRow, myMaze.startCol, 'O')
myMaze.wn[:exitonclick]()
searchFrom(myMaze, myMaze.startRow, myMaze.startCol)
