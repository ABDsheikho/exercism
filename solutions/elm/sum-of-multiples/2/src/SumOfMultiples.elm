module SumOfMultiples exposing (sumOfMultiples)

import Set


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    divisors
        |> List.concatMap (\x -> stepRange x limit x)
        |> Set.fromList
        |> Set.foldr (+) 0


stepRange : Int -> Int -> Int -> List Int
stepRange start end step =
    (end - 1 - start) // step
        |> List.range 0
        |> List.map ((*) step)
        |> List.map ((+) start)
