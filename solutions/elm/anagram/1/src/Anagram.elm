module Anagram exposing (detect)


detect : String -> List String -> List String
detect word candidates =
    List.filter (isAnagram word) candidates


isAnagram : String -> String -> Bool
isAnagram word1 word2 =
    let
        sortedChars =
            String.toLower
                >> String.toList
                >> List.sort
    in
    if String.toLower word1 == String.toLower word2 then
        False
    else
        sortedChars word1 == sortedChars word2
