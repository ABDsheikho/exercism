module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    List.foldr 
        (\x acc -> if predicate x then x :: acc else acc) 
        []
        list


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    List.foldr 
        (\x acc -> if predicate x then acc else x :: acc) 
        []
        list
