module RunLengthEncoding exposing (decode, encode)


encode : String -> String
encode string =
    let
        listChar = 
            string
            |> String.toList
            |> List.map String.fromChar  
    in
    encodeLogic listChar [] 1 ""
    |> String.concat


decode : String -> String
decode string =
    let
        listChar = 
            string
            |> String.toList
            |> List.map String.fromChar
    in
    decodeLogic listChar [] 0
    |> String.concat


encodeLogic : List String -> List String -> Int -> String -> List String
encodeLogic lst acc count currentChar =
    case lst of
        [] ->
            case count of
                1 ->
                    List.append acc [ currentChar ]
                _ ->
                    List.append acc [ String.fromInt count, currentChar ]
        x::xs ->
            if x == currentChar then
                encodeLogic xs acc (count + 1) currentChar
            else
                case count of
                    1 ->
                        encodeLogic xs (List.append acc [ currentChar ]) 1 x
                    _ ->
                        encodeLogic xs (List.append acc [ String.fromInt count, currentChar ]) 1 x


decodeLogic : List String -> List String -> Int -> List String
decodeLogic lst acc count =
    case lst of
        [] ->
            acc
        x::xs ->
            case String.toInt x of
                Nothing ->
                    -- meaning it's a letter
                    let
                        nwCount = if count == 0 then 1 else count
                        nwacc =
                            List.repeat nwCount x
                            |> List.append acc
                            --|> List.concat
                    in
                    decodeLogic xs nwacc 0
                Just number ->
                    decodeLogic xs acc (count*10 + number)
                

