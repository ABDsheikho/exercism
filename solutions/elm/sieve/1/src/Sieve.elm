module Sieve exposing (primes)


primes : Int -> List Int
primes limit =
    limit
        |> List.range 2
        |> filt []


filt : List Int -> List Int -> List Int
filt filtered numbers =
    case numbers of
        [] ->
            filtered
        first::reast ->
            List.filter (\x -> remainderBy first x /= 0) reast
                |> filt (filtered ++ [first])
