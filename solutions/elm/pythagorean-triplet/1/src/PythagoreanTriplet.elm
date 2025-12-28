module PythagoreanTriplet exposing (triplets)


type alias Triplet =
    ( Int, Int, Int )


triplets : Int -> List Triplet
triplets n =
    recLevelOne n 1 []


recLevelOne : Int -> Int -> List Triplet -> List Triplet
recLevelOne n a acc =
    if a > n then
        acc
    else
        recLevelTwo n a (a + 1) acc
            |> recLevelOne n (a + 1)


recLevelTwo : Int -> Int -> Int -> List Triplet -> List Triplet
recLevelTwo n a b acc =
    if b > (n - a) then
        acc
    else if toFloat (n * a + n * b - a * b) == toFloat (n ^ 2) / 2 then
        acc ++ [ ( a, b, n - a - b ) ]
            |> recLevelTwo n a (b + 1)
    else
        recLevelTwo n a (b + 1) acc
