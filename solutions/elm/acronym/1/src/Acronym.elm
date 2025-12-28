module Acronym exposing (abbreviate)


abbreviate : String -> String
abbreviate phrase =
    let
        phraseWithoutDash = phrase |> String.split "-" |> String.join " "
    in
    phraseWithoutDash    
    |> String.words
    |> List.filterMap String.uncons
    |> List.map (\(x, _) -> String.fromChar x)
    |> List.map String.toUpper
    |> String.concat
