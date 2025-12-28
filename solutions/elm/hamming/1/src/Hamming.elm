module Hamming exposing (distance)


distance : String -> String -> Result String Int
distance left right =
    if String.length left /= String.length right then
        Err "strands must be of equal length"
    else
        let
            leftList = String.toList left
            rightList = String.toList right
        in
        List.map2 
            (\v1 v2 -> v1 /= v2) 
            leftList 
            rightList
            |> List.filter identity
            |> List.length
            |> Ok
