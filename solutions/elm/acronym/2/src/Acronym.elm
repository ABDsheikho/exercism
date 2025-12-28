module Acronym exposing (abbreviate)


abbreviate : String -> String
abbreviate phrase =
    phrase
    |> String.replace "-" " "
    |> String.words
    |> List.filterMap String.uncons
    |> List.map (\(x, _) -> String.fromChar x)
    |> List.map String.toUpper
    |> String.concat
