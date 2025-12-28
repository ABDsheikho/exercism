module MazeMaker exposing (..)

import Random exposing (Generator)


type Maze
    = DeadEnd
    | Room Treasure
    | Branch (List Maze)


type Treasure
    = Gold
    | Diamond
    | Friendship


deadend : Generator Maze
deadend =
    Random.constant DeadEnd


treasure : Generator Treasure
treasure =
    Random.uniform Friendship [ Diamond, Gold ]


room : Generator Maze
room =
    treasure |> Random.map (\x -> Room x)


branch : Generator Maze -> Generator Maze
branch mazeGenerator =
    Random.int 2 4
        |> Random.andThen (\val -> Random.list val mazeGenerator)
        |> Random.map (\lst -> Branch lst)


maze : Generator Maze
maze =
    Random.weighted
        ( 60, deadend )
        [ ( 15, room )
        , ( 25, Random.lazy (\_ -> branch maze) )
        ]
        |> Random.andThen identity


mazeOfDepth : Int -> Generator Maze
mazeOfDepth depth =
    if depth == 0 then
        Random.uniform deadend [ room ]
            |> Random.andThen identity

    else
        branch <| Random.lazy (\_ -> mazeOfDepth <| depth - 1)
