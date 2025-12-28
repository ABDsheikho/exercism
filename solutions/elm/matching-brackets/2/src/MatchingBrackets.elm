module MatchingBrackets exposing (isPaired)


leftBrackets =
    [ '(', '{', '[' ]


rightBrackets =
    [ ')', '}', ']' ]


matchBrackets : Char -> List Char -> List Char
matchBrackets char list =
    if List.member char leftBrackets then
        -- push bracket into list
        char :: list

    else if List.member char rightBrackets then
        -- check if list's first value corresponds to the bracket
        -- if true: don't push, and remove corresponding bracket
        -- if false: push bracket anyway
        case ( list, char ) of
            ( '(' :: reast, ')' ) ->
                reast

            ( '{' :: reast, '}' ) ->
                reast

            ( '[' :: reast, ']' ) ->
                reast

            _ ->
                -- something off, push anyway
                char :: list

    else
        list


isPaired : String -> Bool
isPaired input =
    String.toList input
        |> List.foldl matchBrackets []
        |> List.length
        |> (==) 0
