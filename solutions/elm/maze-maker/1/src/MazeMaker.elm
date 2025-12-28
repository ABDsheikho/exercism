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
    Random.lazy (\_ -> Random.constant DeadEnd)


treasure : Generator Treasure
treasure =
    Random.lazy (\_ -> Random.uniform Friendship [ Diamond, Gold ])


room : Generator Maze
room =
    Random.lazy (\_ -> treasure |> Random.map (\x -> Room x))


branch : Generator Maze -> Generator Maze
branch mazeGenerator =
    Random.lazy
        (\_ ->
            Random.int 2 4
                |> Random.andThen (\val -> Random.list val mazeGenerator)
                |> Random.map (\lst -> Branch lst)
        )


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
        Random.lazy (\_ -> branch <| mazeOfDepth <| depth - 1)
