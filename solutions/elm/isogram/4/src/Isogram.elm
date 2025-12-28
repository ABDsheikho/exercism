{-
Using Set in this situation is definitely a more efficient approach compared to using List. The time complexity of checking membership in a Set is O(log n), while the time complexity of checking membership in a List is O(n). This means that using Set will be faster for larger inputs.

Additionally, the memory complexity of a Set is O(n), while the memory complexity of a List is also O(n). However, Sets have the advantage of not allowing duplicate elements, which can be useful in scenarios where you need to ensure uniqueness.

In conclusion, using Set for checking if a word or phrase is an isogram is a better choice in terms of both time and memory complexity. Your v2 solution using Set.fromList and comparing the size with the length of the original list is a more efficient and concise approach.
-}
module Isogram exposing (isIsogram)

import Set

isIsogram : String -> Bool
isIsogram sentence =
    let
        charList = 
            sentence
            |> String.replace "-" ""
            |> String.replace " " ""
            |> String.toLower
            |> String.toList
    in
    charList
    |> Set.fromList
    |> Set.size
    |> (==) (List.length charList)