module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )

-- a type that correspond to a direction property
type Turn         -- maybe I've should call it orientation
    = Clockwise
    | CounterClockwise

type Bearing
    = North
    | East
    | South
    | West

-- a type that correspond to a point coordinates 
type alias Coordinates =
    { x : Int
    , y : Int
    }

type alias Robot =
    { bearing : Bearing
    , coordinates : Coordinates
    }

defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }

-- prepare turnRight & turnLeft functionality

turn : Bearing -> Turn -> Bearing
turn bearing dir =
    case (bearing, dir) of
    (North, Clockwise) -> East
    (North, CounterClockwise) -> West
    (East, Clockwise) -> South
    (East, CounterClockwise) -> North
    (South, Clockwise) -> West
    (South, CounterClockwise) -> East
    (West, Clockwise) -> North
    (West, CounterClockwise) -> South
        

turnRight : Robot -> Robot
turnRight robot =
    {robot | bearing= turn robot.bearing Clockwise }


turnLeft : Robot -> Robot
turnLeft robot =
    {robot | bearing= turn robot.bearing CounterClockwise }

-- prepare advance functionality

calcCoordinates : Coordinates -> Bearing -> Coordinates
calcCoordinates coordinates bearing =
    let
        {x, y} = coordinates 
    in
    case bearing of
    North ->
        {coordinates | y= y+1 }
    East ->
        {coordinates | x= x+1 }
    South ->
        {coordinates | y= y-1 }
    West ->
        {coordinates | x= x-1 }

advance : Robot -> Robot
advance robot =
    calcCoordinates robot.coordinates robot.bearing
    |> Robot robot.bearing

-- additional actioin

doNothing : Robot -> Robot
doNothing robot = robot

-- prepare simulate functionality

action : Char -> Robot -> Robot
action char =
    case char of
    'R' -> turnRight
    'L' -> turnLeft
    'A' -> advance
    _ -> doNothing

simulate : String -> Robot -> Robot
simulate directions robot =
    String.foldl action robot directions
{-
    case (String.uncons directions) of
    Just (head, rest) ->
        action head robot
        |> simulate rest 
    Nothing ->
        robot
-}