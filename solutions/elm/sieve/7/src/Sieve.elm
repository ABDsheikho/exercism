module Sieve exposing (primes)


primes : Int -> List Int
primes limit =
    List.range 2 limit
        |> recursiveSieve [] limit


{-
   recursiveSieve is the locigal builder for `primes` function,
   which append into initial `receiver` parameter the *head* of `numberList`,
   and filters `numberList` according to `stepRange` with step equal to that *head*.
-}
recursiveSieve : List Int -> Int -> List Int -> List Int
recursiveSieve receiver limit numberList =
    case numberList of
        [] ->
            receiver
        first :: reast ->
            if first ^ 2 > limit then
                receiver ++ numberList
            else
                reast
                    |> (purgeList <|
                            stepRange (first ^ 2) limit first
                       )
                    |> recursiveSieve (receiver ++ [ first ]) limit


{-
   stepRange is refined `List.range` function that takes `step` parameter
   into account with `end` value included to the resulting list.
-}
stepRange : Int -> Int -> Int -> List Int
stepRange start end step =
    stepRangeBuilder start end step []



{-
   I could have *and I did* implemented stepRange as:

   stepRange : Int -> Int -> Int -> List Int
   stepRange start end step =
       (end - start) // step
           |> List.range 0
           |> List.map ((*) step)
           |> List.map ((+) start)

   and although its more efficient in both memory and time complexity,
   but it will raise an analysis error for using (//) function.
-}


{-
   stepRangeBuilder is build function for `stepRange`.
-}
stepRangeBuilder : Int -> Int -> Int -> List Int -> List Int
stepRangeBuilder start end step initialList =
    if start > end then
        initialList
    else
        initialList
            ++ [ start ]
            |> stepRangeBuilder (start + step) end step


{-
   purgeList filters common values that exists in both `baseList`
   and `toExcludeList` and returns new filtered `baseList`.
-}
purgeList : List a -> List a -> List a
purgeList toExcludeList baseList =
    case ( toExcludeList, baseList ) of
        ( [], _ ) ->
            baseList
        ( _, [] ) ->
            baseList
        ( first :: reast, _ ) ->
            List.filter (\x -> x /= first) baseList
                |> purgeList reast
