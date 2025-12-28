module MatchingBrackets exposing (isPaired)


leftBrackets =
    [ '(', '{', '[' ]


rightBrackets =
    [ ')', '}', ']' ]


isPaired : String -> Bool
isPaired input =
    let
        isPairedHelper : List Char -> List Char -> List Char
        isPairedHelper seq acc =
            case seq of
                [] ->
                    acc

                head :: tail ->
                    if List.member head leftBrackets then
                        -- push bracket into acc
                        acc
                            |> (::) head
                            |> isPairedHelper tail

                    else if List.member head rightBrackets then
                        -- check if acc's first value corresponds to the bracket
                        -- if true: don't push, and remove corresponding bracket
                        -- if false: push bracket anyway
                        case ( acc, head ) of
                            ( '(' :: reast, ')' ) ->
                                isPairedHelper tail reast

                            ( '{' :: reast, '}' ) ->
                                isPairedHelper tail reast

                            ( '[' :: reast, ']' ) ->
                                isPairedHelper tail reast

                            _ ->
                                acc
                                    |> (::) head
                                    |> isPairedHelper tail

                    else
                        isPairedHelper tail acc
    in
    isPairedHelper (String.toList input) []
        |> (\lst -> List.length lst == 0)
