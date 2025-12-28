module WordCount exposing (wordCount)

import Dict exposing (Dict)
import Regex


word =
    Maybe.withDefault Regex.never <|
        Regex.fromString "([\\w]+'[\\w]+)|([\\w]+)"


wordCount : String -> Dict String Int
wordCount sentence =
    let
        insertAndUpdate =
            Maybe.map ((+) 1) >> Maybe.withDefault 1 >> Just
    in
    String.toLower sentence
        |> Regex.find word
        |> List.map .match
        |> List.foldl
            (\char dict -> Dict.update char insertAndUpdate dict)
            Dict.empty
