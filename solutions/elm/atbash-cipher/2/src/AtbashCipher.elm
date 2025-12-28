module AtbashCipher exposing (decode, encode)

import Dict exposing (Dict)


azList : List Char
azList =
    List.range (Char.toCode 'a') (Char.toCode 'z')
        |> List.map Char.fromCode


zaList : List Char
zaList =
    List.reverse azList


cipherKey : Dict Char Char
cipherKey =
    List.map2 Tuple.pair azList zaList
        |> Dict.fromList


encode : String -> String
encode plain =
    plain
        |> String.toLower
        |> String.toList
        |> List.filter Char.isAlphaNum
        |> List.map (\x -> Maybe.withDefault x <| Dict.get x cipherKey)
        |> group [] 5
        |> List.intersperse [ ' ' ]
        |> List.concat
        |> String.fromList


decode : String -> String
decode cipher =
    cipher
        |> String.replace " " ""
        |> String.toList
        |> List.map (\x -> Maybe.withDefault x <| Dict.get x cipherKey)
        |> String.fromList


group : List (List a) -> Int -> List a -> List (List a)
group acc span list =
    let
        head = List.take span list
        tail = List.drop span list
    in
    case list of
        [] ->
            acc
        _ ->
            group (acc ++ [ head ]) span tail
