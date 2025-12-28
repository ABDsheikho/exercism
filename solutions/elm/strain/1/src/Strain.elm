module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    List.partition predicate list
        |> Tuple.first


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    List.partition predicate list
        |> Tuple.second
