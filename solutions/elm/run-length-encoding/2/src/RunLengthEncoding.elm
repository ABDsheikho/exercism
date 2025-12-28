module RunLengthEncoding exposing (decode, encode)


encode : String -> String
encode string =
    string
        |> String.toList
        |> List.map String.fromChar
        |> encodeLogic [] 1 ""
        |> String.concat


decode : String -> String
decode string =
    string
        |> String.toList
        |> List.map String.fromChar
        |> decodeLogic [] 0
        |> String.concat


encodeLogic : List String -> Int -> String -> List String -> List String
encodeLogic acc count currentChar lst =
    let
        charIsSame = (==) currentChar <| Maybe.withDefault "" <| List.head lst
    in
    case (count, charIsSame, lst) of
        (1, _, []) ->
                acc ++ [ currentChar ]
        (_, _, []) ->
                acc ++ [ String.fromInt count, currentChar ]
        (_, True, x::xs) ->
                encodeLogic acc (count + 1) currentChar xs
        (1, False, x::xs) ->
                encodeLogic (acc ++ [ currentChar ]) 1 x xs
        (_, False, x::xs) ->
                encodeLogic (acc ++ [ String.fromInt count,  currentChar ]) 1 x xs


decodeLogic : List String -> Int -> List String -> List String
decodeLogic acc count lst =
    case lst of
        [] ->
            acc
        x::xs ->
            case String.toInt x of
                Nothing ->
                    -- meaning it's a letter
                    let
                        realCount = if count == 0 then 1 else count
                        repeatedChar = List.repeat realCount x
                    in
                    decodeLogic (acc ++ repeatedChar) 0 xs
                Just number ->
                    decodeLogic acc (count*10 + number) xs
                

